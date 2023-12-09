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
  late Rx<File?> _pickImage;
  bool get isLoading => _isLoading;
  //picked Image
File? get profilePhoto => _pickImage.value;

void pickedImage()async{
  final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
  if(pickedImage != null){
    Get.snackbar('Profile Picture',
        'You have successfully selected your profile picture!');
  }
  //put image path
  _pickImage = Rx<File?>(File(pickedImage!.path));
}

//method for upload the firebase storage(image upload)
Future<String> _uploadToStorage(File image) async{
  Reference ref = firebaseStorage
      .ref()
      .child('profilePics')
      .child(firebaseAuth.currentUser!.uid);
  UploadTask uploadTask = ref.putFile(image);
  TaskSnapshot snap = await uploadTask;
  String downloadUrl = await snap.ref.getDownloadURL();
  return downloadUrl;
}

//registering the user
  void registerUser(
  String firstName,
  String lastName,
  String userName,
  File? image, // we are saving photo url not photo that's why string
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
     image !=null &&
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
      });
    }else{
      Get.snackbar("Error Creating Account", 'Please enter all the fields');
    }
  }catch (e){
    Get.snackbar('Error Creating Account', e.toString());
  }
  _isLoading = false;
  update();
  }
}