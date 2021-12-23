import 'package:caupe_custumer/presentation/pages/terms_and_conditions/terms_and_conditions_binding.dart';
import 'package:caupe_custumer/presentation/pages/terms_and_conditions/terms_and_conditions_page.dart';
import 'package:get/route_manager.dart';

import '../../presentation/pages/details/details.dart';
import '../../presentation/pages/help/help.dart';
import '../../presentation/pages/home/home.dart';
import '../../presentation/pages/invite_friends/invite_friends.dart';
import '../../presentation/pages/login/login.dart';
import '../../presentation/pages/profile/profile.dart';
import '../../presentation/pages/register/register.dart';
import '../../presentation/pages/verified/verified.dart';
import '../constants/constants.dart';

class Routers {
  static List<GetPage> pages = [
    GetPage(
      name: RoutesConsts.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RoutesConsts.register,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: RoutesConsts.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RoutesConsts.profile,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: RoutesConsts.help,
      page: () => HelpPage(),
      binding: HelpBinding(),
    ),
    GetPage(
      name: RoutesConsts.inviteFriends,
      page: () => InviteFriendsPage(),
      binding: InviteBinding(),
    ),
    GetPage(
      name: RoutesConsts.details,
      page: () => DetailsPage(),
      binding: DetailsBinding(),
    ),
    GetPage(
      name: RoutesConsts.verified,
      page: () => VerifiedPage(),
      binding: VerifiedBinding(),
    ),
    GetPage(
      name: RoutesConsts.termsAndConditions,
      page: () => TermsAndConditionsPage(),
      binding: TermsOfConditionsBinding(),
    ),
  ];
}
