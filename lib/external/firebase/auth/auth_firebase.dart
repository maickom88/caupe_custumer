import 'package:flutter_login_facebook/flutter_login_facebook.dart';

import '../errors/firebase_handler_errors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/errors/errors.dart';
import '../../../data/datasources/auth_datasource.dart';
import '../../../data/models/auth_response_model.dart';

class AuthFirebase implements AuthDatasource {
  final _googleSignIn = GoogleSignIn();
  final _localStorage = GetStorage();
  final _firebaseAuth = FirebaseAuth.instance;
  final _facebookLogin = FacebookLogin();

  @override
  Future<AuthResponseModel> loginWithApple() {
    throw UnimplementedError();
  }

  @override
  Future<AuthResponseModel> loginWithFacebook() async {
    try {
      final res = await _facebookLogin.logIn(permissions: [
        FacebookPermission.publicProfile,
        FacebookPermission.email
      ]);
      switch (res.status) {
        case FacebookLoginStatus.success:
          final facebookToken = res.accessToken;
          final credential =
              FacebookAuthProvider.credential(facebookToken!.token);
          return await _signInWithCredential(credential);
        case FacebookLoginStatus.cancel:
          throw LoginCancel();
        case FacebookLoginStatus.error:
          await logout();
          throw Exception();
      }
    } on FirebaseAuthException catch (e) {
      throw firebaseHandlersErrors(typeError: e);
    } catch (e) {
      throw firebaseHandlersErrors();
    }
  }

  @override
  Future<AuthResponseModel> loginWithGoogle() async {
    try {
      final googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        return _signInWithCredential(credential);
      }
      throw LoginCancel();
    } on FirebaseAuthException catch (e) {
      throw firebaseHandlersErrors(typeError: e);
    } catch (e) {
      throw firebaseHandlersErrors();
    }
  }

  Future<AuthResponseModel> _signInWithCredential(
      AuthCredential credential) async {
    final userCredential = await _firebaseAuth.signInWithCredential(credential);
    return await _saveToken(userCredential);
  }

  Future<AuthResponseModel> _saveToken(UserCredential userCredential) async {
    final authResponse =
        await AuthResponseModel().fromCredential(userCredential);
    await _localStorage.write('token', authResponse.token);
    await _localStorage.write('userInformation', authResponse.toMap());
    return authResponse;
  }

  @override
  Future<AuthResponseModel> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return await _saveToken(userCredential);
    } on FirebaseAuthException catch (e) {
      throw firebaseHandlersErrors(typeError: e);
    } catch (e) {
      throw firebaseHandlersErrors();
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
      await _googleSignIn.signOut();
      await _localStorage.remove('token');
      await _localStorage.remove('userInformation');
    } on FirebaseAuthException catch (e) {
      throw firebaseHandlersErrors(typeError: e);
    } catch (e) {
      throw firebaseHandlersErrors();
    }
  }

  @override
  Future<AuthResponseModel> registerAccount(
      String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final emailVerified = userCredential.user?.emailVerified ?? false;
      if (!emailVerified) {
        await userCredential.user?.sendEmailVerification();
      }
      return await _saveToken(userCredential);
    } on FirebaseAuthException catch (e) {
      throw firebaseHandlersErrors(typeError: e);
    } catch (e) {
      throw firebaseHandlersErrors();
    }
  }

  @override
  Future<void> sendEmailVerification(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      await userCredential.user?.sendEmailVerification();
      await logout();
      return;
    } on FirebaseAuthException catch (e) {
      throw firebaseHandlersErrors(typeError: e);
    } catch (e) {
      throw firebaseHandlersErrors();
    }
  }

  @override
  Future<void> sendPhoneAuth(String phone) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: '+55$phone',
        timeout: const Duration(seconds: 60),
        verificationCompleted: (phoneCredential) {
          _firebaseAuth.signInWithCredential(phoneCredential);
        },
        verificationFailed: (error) {
          throw error;
        },
        codeSent: (String verificationId, int? resendToken) async {
          await _localStorage.write("verificationId", verificationId);
        },
        codeAutoRetrievalTimeout: (codeAutoRetrievalTimeout) {},
      );
      return;
    } on FirebaseAuthException catch (e) {
      throw firebaseHandlersErrors(typeError: e);
    } catch (e) {
      throw firebaseHandlersErrors();
    }
  }

  @override
  Future<bool> signInWithPhone(String otp) async {
    try {
      final verificationId = _localStorage.read('verificationId');
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );
      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      final token = await userCredential.user?.getIdToken();
      if (token != null) {
        return true;
      }
      return false;
    } on FirebaseAuthException catch (e) {
      throw firebaseHandlersErrors(typeError: e);
    } catch (e) {
      throw firebaseHandlersErrors();
    }
  }
}
