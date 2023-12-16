import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_flare/presentation/state_holders/post_screen_controller.dart';
import 'package:share_flare/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:share_flare/presentation/ui/utilities/auth_constant.dart';
import 'package:share_flare/presentation/ui/utilities/colors.dart';
import 'package:share_flare/presentation/ui/utilities/theme/theme.dart';
import 'package:share_flare/presentation/ui/widgets/post/post_location_button_listview.dart';
import 'package:share_flare/presentation/ui/widgets/post/post_music_button_listview.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key, required bool camera});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

bool isLoading = false;


class _PostScreenState extends State<PostScreen> {
  final _postController = Get.find<PostScreenController>();

  void postImage(String uid,
      String username,
      String profImage,) async {
    try {
      BuildContext? currentContext = Get.context;

      // Create a copy of the imageList to avoid concurrent modification
      List<Uint8List> copyImageList = List.from(_postController.imageList);

      String res = await PostScreenController().uploadPost(
        _postController.descriptionTE.text,
        copyImageList,
        uid,
        username,
        profImage,
      );

      if (res == "success") {
        Get.snackbar('Successfully Posted!', '',
            backgroundColor: Colors.green, colorText: Colors.white, snackPosition: SnackPosition.BOTTOM);

      } else {
        Get.snackbar('Error', res,
            backgroundColor: Colors.red, colorText: Colors.white,  snackPosition: SnackPosition.BOTTOM);
      }
    } catch (err) {
      Get.snackbar('Error', err.toString(),
          backgroundColor: Colors.red, colorText: Colors.white,  snackPosition: SnackPosition.BOTTOM);
    }
  }



  @override
  void initState() {
    super.initState();
    _postController.loadGalleryImages();
    _postController.pickImageFromCamera();
    userProfileController.userData;
    userProfileController.listenToUserInfo();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _postController.clearTheControllers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = SFAppTheme.isDarkMode(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            color: dark
                ? const Color(0xFF1D2939)
                : SFColors.white, // Set the background color explicitly
          ),
          backgroundColor: dark ? const Color(0xFF1D2939) : SFColors.white,
          title: Text(
            'New Post',
            style: TextStyle(
                color: dark ? SFColors.white : const Color(0xFF1D2939),
                fontWeight: FontWeight.w600),
          ),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: dark ? SFColors.white : const Color(0xFF1D2939),
              size: 25,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      // Call postImage without await, and immediately create a Future that completes
                      postImage(
                          FirebaseAuth.instance.currentUser!.uid,
                          userProfileController.fetchUserModel.userName!,
                          userProfileController.fetchUserModel.profilePhoto!
                      );

                      _postController.imageList.clear();
                      _postController.descriptionTE.clear();

                      // Navigate to another screen (replace 'PostScreen' with your actual screen)
                      Get.to(() => const MainBottomNavScreen(camera: true,));
                    },
                    child: const Text(
                      'Post',
                      style: TextStyle(
                        color: Color(0xFF4478FF),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: Color(0xFF4478FF),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body:
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: Column(
                      children: [
                        Expanded(
                          child: GridView.builder(
                            itemCount: _postController.imageList.length,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              mainAxisSpacing: 1,
                              crossAxisSpacing: 1,
                            ),
                            itemBuilder: (context, index) {
                              final dynamic image = _postController.imageList[index];

                              if (image is Uint8List) {
                                // Display images from camera using Image.memory
                                return Image.memory(
                                  image,
                                  fit: BoxFit.cover,
                                );
                              } else if (image is File) {
                                // Display images from gallery using Image.file
                                return Image.file(
                                  image,
                                  fit: BoxFit.cover,
                                );
                              } else {
                                // Handle other types accordingly
                                return Container();
                              }
                            },

                            // itemBuilder: (context, index) {
                            //   return Image.memory(
                            //     _postController.imageList[index],
                            //     fit: BoxFit.cover,
                            //   );
                            // },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 230,
                    height: 90,
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.transparent
                        // border: Border.all(color: Colors.white),
                        // borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextFormField(
                        maxLines: 3,
                        controller: _postController.descriptionTE,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(1.0),
                          hintText: 'Write a caption...',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          // Remove blue border on focus
                          enabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey.withOpacity(0.2),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Add Location',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),
            Divider(
              color: Colors.grey.withOpacity(0.2),
            ),
            const PostLocationButtonListView(),
            Divider(
              color: Colors.grey.withOpacity(0.2),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Add Music',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),
            Divider(
              color: Colors.grey.withOpacity(0.2),
            ),
            const PostMusicButtonListView(),
            Divider(
              color: Colors.grey.withOpacity(0.2),
            ),

          ],
        ),
      ),
    );
  }


}