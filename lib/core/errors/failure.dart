class Failure implements Exception {
  String get message => message;
}

class LoginCancel implements Failure {
  String get message => 'Login canceled by user';
}

class UserNotFound implements Failure {
  String get message => 'User not found';
}

class EmailInvalid implements Failure {
  String get message => 'This email is invalid';
}

class IncorrectPassword implements Failure {
  String get message => 'Incorrect password';
}

class UserAlreadyExist implements Failure {
  String get message => 'User already exist';
}

class ServerError implements Failure {
  String get message => 'An unexpected error has occurred';
}

class NumberPhoneInvalid implements Failure {
  String get message => 'Phone number is invalid!';
}
