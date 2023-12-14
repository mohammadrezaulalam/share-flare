import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_flare/presentation/state_holders/post_screen_controller.dart';
import 'package:share_flare/presentation/state_holders/registration_controller.dart';
import 'package:share_flare/presentation/ui/utilities/colors.dart';
import 'package:share_flare/presentation/ui/utilities/theme/theme.dart';
import 'package:share_flare/presentation/ui/utilities/utiles.dart';
import 'package:share_flare/presentation/ui/widgets/post/post_location_button_listview.dart';
import 'package:share_flare/presentation/ui/widgets/post/post_music_button_listview.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

bool isLoading = false;

class _PostScreenState extends State<PostScreen> {
  final _postController = Get.find<PostScreenController>();
  final _signupController = Get.find<SignUpController>();

  void postImage(
    String uid,
    String username,
    String profImage,
  ) async {

    try {

      String res = await PostScreenController().uploadPost(
        _postController.descriptionTE.text,
        _postController.imageList as Uint8List,
        uid,
        username,
        profImage,
      );
      if (res == "success") {
        showSnackBar(
            context,
            'Posted!',
          );

      } else {

          showSnackBar(context, res);

      }
    } catch (err) {
      showSnackBar(
        context,
        err.toString()
      );
    }}

  // void postImage(String uid, String username, String profImage) async {
  //   try {
  //     List<String> photoUrls = [];
  //
  //     for (Uint8List image in _postController.imageList) {
  //       String res = await SignUpController.instance.uploadImgToStorage('posts', image, true);
  //       photoUrls.add(res);
  //     }
  //
  //     String description = _postController.descriptionTE.text;
  //
  //     // Create the post with multiple images
  //     String res = await PostScreenController().uploadPost(
  //       description,
  //       photoUrls as Uint8List,
  //       uid,
  //       username,
  //       profImage,
  //     );
  //
  //     if (res == "success") {
  //       showSnackBar(
  //         context,
  //         'Posted!',
  //       );
  //     } else {
  //       showSnackBar(context, res);
  //     }
  //   } catch (err) {
  //     showSnackBar(
  //       context,
  //       err.toString(),
  //     );
  //   }
  // }

  @override
  void initState() {
    super.initState();
    _postController.loadGalleryImages();
  }

  @override
  void dispose() {
    super.dispose();
    _postController.descriptionTE.dispose();
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
              padding: EdgeInsets.only(right: 16),
              child: Row(
                children: [
                 //  GestureDetector(
                 //    onTap: () =>
                 //        postImage(
                 //          FirebaseAuth.instance.currentUser!.uid
                 //          // _signupController.user!.uid??'',
                 //
                 //          // _signupController.user!.userName,
                 //          // _signupController.user!.profilePhoto
                 //
                 //        )
                 //
                 // ,
                 //    child: const Text(
                 //      'Post',
                 //      style: TextStyle(
                 //          color: Color(0xFF4478FF),
                 //          fontWeight: FontWeight.w600),
                 //    ),
                 //  ),
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
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
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
                              return Image.memory(
                                _postController.imageList[index],
                                // Display the image from the list
                                fit: BoxFit.cover,
                              );
                            },
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
