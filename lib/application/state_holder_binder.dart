import 'package:get/get.dart';
import 'package:share_flare/presentation/state_holders/post_screen_controller.dart';
import 'package:share_flare/presentation/state_holders/auth_controller.dart';
import 'package:share_flare/presentation/state_holders/follow_user_controller.dart';
import 'package:share_flare/presentation/state_holders/profile_search_controller.dart';
import 'package:share_flare/presentation/state_holders/login_controller.dart';
import 'package:share_flare/presentation/state_holders/user_controller.dart';

import '../presentation/state_holders/chat_controller.dart';
import '../presentation/state_holders/registration_controller.dart';

class StateHolderBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileSearchController());
    Get.put(RegistrationController());
    Get.put(LoginController());
    Get.put(PostScreenController());
    Get.put(UserProfileController());
     Get.put(AuthController());
     Get.put(ChatController());
    Get.put(FollowUserController());

  }
}
