import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_flare/presentation/ui/utilities/colors.dart';
import 'package:share_flare/presentation/ui/utilities/theme/theme.dart';

import 'post_screen.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final List<Widget> _mediaList = [];

  int currentPage = 0;
  int? lastPage;

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
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const PostScreen());
                },
                child: const Row(
                  children: [
                    Text(
                      'Next',
                      style: TextStyle(
                          color: Color(0xFF4478FF),
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: Color(0xFF4478FF),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 370,
                child: GridView.builder(
                  itemCount: 1,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            0), // Adjust the radius as needed
                      ),
                      child: Image.asset(
                        'assets/images/img_11.png',
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Container(
                  width: double.infinity,
                  height: 40,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Text(
                            'Recent photos',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 35,
                            weight: 10,
                            opticalSize: 4,
                            color: Colors.black87,
                          )
                        ],
                      ),
                      Container(
                        width: 118,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.paste,
                                size: 15,
                                color: Colors.black87,
                              ),
                              SizedBox(width: 2),
                              Text(
                                'Multiple Select',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                    ),
                    itemBuilder: (context, index) {
                      return Image.asset(
                      'assets/images/img_11.png',
                      fit: BoxFit.cover,
                                              );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
