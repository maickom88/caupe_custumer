import '../../../core/errors/errors.dart';

Failure firebaseHandlersErrors({typeError}) {
  if (typeError?.code == 'invalid-phone-number') {
    return NumberPhoneInvalid();
  }
  if (typeError?.code == "user-not-found") {
    return UserNotFound();
  }
  if (typeError?.message ==
      "The operation couldn’t be completed. (com.apple.AuthenticationServices.AuthorizationError error 1001.)") {
    return LoginCancel();
  }
  if (typeError?.code == "invalid-email") {
    return EmailInvalid();
  }
  if (typeError?.code == "wrong-password") {
    return IncorrectPassword();
  }
  if (typeError?.code == "email-already-in-use") {
    return UserAlreadyExist();
  }
  if (typeError is LoginCancel) {
    return LoginCancel();
  }
  return ServerError();
}
