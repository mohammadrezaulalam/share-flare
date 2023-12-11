
import 'package:get/get.dart';
import 'package:share_flare/presentation/state_holders/profile_search_controller.dart';
import 'package:share_flare/presentation/state_holders/sign_in_controller.dart';

import '../presentation/state_holders/sign_up_controller.dart';

class StateHolderBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(ProfileSearchController());
     Get.put(SignUpController());
     Get.put(SignInController());
  }

}