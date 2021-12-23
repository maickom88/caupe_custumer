import '../models/models.dart';

abstract class AuthDatasource {
  Future<AuthResponseModel> loginWithGoogle();
  Future<AuthResponseModel> loginWithFacebook();
  Future<AuthResponseModel> loginWithApple();
  Future<AuthResponseModel> loginWithEmailAndPassword(
      String email, String password);
  Future<AuthResponseModel> registerAccount(String email, String password);
  Future<void> logout();
  Future<void> sendPhoneAuth(String phone);
  Future<bool> signInWithPhone(String otp);
  Future<void> sendEmailVerification(String email, String password);
}
