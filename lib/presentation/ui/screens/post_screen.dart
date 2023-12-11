import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_flare/presentation/ui/utilities/colors.dart';
import 'package:share_flare/presentation/ui/utilities/theme/theme.dart';
import 'package:share_flare/presentation/ui/widgets/post/post_location_button_listview.dart';
import 'package:share_flare/presentation/ui/widgets/post/post_music_button_listview.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

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
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                children: [
                  Text(
                    'Post',
                    style: TextStyle(
                        color: Color(0xFF4478FF), fontWeight: FontWeight.w600),
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
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://tse1.mm.bing.net/th?id=OIP.4g9-yIBm-G56rSlQAEFp6AHaE9&pid=Api&rs=1&c=1&qlt=95&w=156&h=104'),
                        fit: BoxFit.cover,
                      ),
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
