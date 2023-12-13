import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
class AuthController extends GetxController{
  static AuthController instance = Get.find();
  RxBool _isLoggedIn = false.obs;
  bool get isLoggedIn => _isLoggedIn.value;

  Future<void> setAuthStatus(bool status)async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('getStatus', status);
    _isLoggedIn.value=status;
    print("setAuthStatus is by parameter: $status");
    print("setAuthStatus is by rxBool: ${_isLoggedIn.value}");
  }

  Future<bool> getAuthStatus()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? result= sharedPreferences.getBool('getStatus');
    _isLoggedIn.value=result?? false;
    print("getAuthStatus is : $result");
    return _isLoggedIn.value;

  }
  Future<void>logOut()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     sharedPreferences.clear() ;
      _isLoggedIn.value=false;
    print("logOut by shredPreference : ${_isLoggedIn.value}");

  }

}