import 'package:get_storage/get_storage.dart';

class RoutesConsts {
  static Future<String> get initialRoute async {
    if (GetStorage().hasData('token')) {
      return home;
    }
    return login;
  }

  static const login = '/login';
  static const home = '/home';
  static const register = '/register';
  static const profile = '/profile';
  static const help = '/help';
  static const inviteFriends = '/invite-friends';
  static const details = '/details';
  static const verified = '/verified-email';
  static const termsAndConditions = '/terms-and-conditions';
}
