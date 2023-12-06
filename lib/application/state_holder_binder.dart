
import 'package:get/get.dart';
import 'package:share_flare/presentation/state_holders/profile_search_controller.dart';

class StateHolderBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(ProfileSearchController());
  }

}