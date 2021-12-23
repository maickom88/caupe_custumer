import 'package:get/instance_manager.dart';

import 'invite_friends.dart';

class InviteBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InviteFriendsController());
  }
}
