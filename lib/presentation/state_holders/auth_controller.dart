import 'dart:ffi';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_flare/data/models/user_model_registration.dart';
import 'package:share_flare/presentation/ui/utilities/auth_constant.dart';
class AuthController extends GetxController{
  static AuthController instance = Get.find();

  bool _isLoading = false;
  RxString _imagePath = ''.obs;
  bool get isLoading => _isLoading;
  //picked Image
String get profilePhoto => _imagePath.value;

void pickedImage()async{
  final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
  if(pickedImage != null){
    //put image path
    _imagePath.value=pickedImage.path.toString();
    Get.snackbar('Profile Picture',
        'You have successfully selected your profile picture!');
  }


}

//method for upload the firebase storage(image upload)
Future<String> _uploadToStorage(String imagepath) async{
  File image = File(imagepath); // string to File convert
  Reference ref = firebaseStorage
      .ref()
      .child('profilePics')
      .child(firebaseAuth.currentUser!.uid);
  UploadTask uploadTask = ref.putFile(image);
  TaskSnapshot snap = await uploadTask;
  String downloadUrl = await snap.ref.getDownloadURL();
  return downloadUrl;
}

//registering the user, make this method for Future<bool> only for use await and .then() method in signup screen
  Future<bool> registerUser(
  String firstName,
  String lastName,
  String userName,
  String image, // we are saving photo url not photo that's why string
  String email,
  String password )async{
  _isLoading = true;
  update();
  //make sure every parameter has data
  try{
    if(
    firstName.isNotEmpty &&
     lastName.isNotEmpty &&
     userName.isNotEmpty &&
     email.isNotEmpty &&
     // image !=null &&
     image.isNotEmpty &&
     password.isNotEmpty
    ){
     UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
     String downloadUrl = await _uploadToStorage(image);

     //add model class
      UserModelRegistration user = UserModelRegistration(firstName: firstName, lastName: lastName, userName: userName, profilePhoto: downloadUrl, email: email, uid: cred.user!.uid);

      //add data to firestore database
      await fireStore
     .collection('users')
     .doc(cred.user!.uid)
     .set(user.toJson())
     .then((value){
        _isLoading = false;
        update();
        Get.snackbar("Success", 'Success');
        return true; //
      });
    }else{
      Get.snackbar("Error Creating Account", 'Please enter all the fields');
    }
  }catch (e){
    Get.snackbar('Error Creating Account', e.toString());
  }
  _isLoading = false;
  return false;
  update();
  }
}