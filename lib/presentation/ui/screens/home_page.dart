import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:share_flare/presentation/ui/screens/chat_screen.dart';
import 'package:share_flare/presentation/ui/screens/notification_screen.dart';
//import 'package:share_flare/presentation/ui/screens/other_users_profile_screen.dart';
import 'package:share_flare/presentation/ui/utilities/assets_path.dart';
import 'package:share_flare/presentation/ui/utilities/auth_constant.dart';
import 'package:share_flare/presentation/ui/utilities/colors.dart';
import 'package:share_flare/presentation/ui/utilities/theme/theme.dart';
import 'package:share_flare/presentation/ui/widgets/app_title.dart';
import 'package:share_flare/presentation/ui/widgets/upload_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> storyItems = [
    {'img': SFAssetsPath.mePNG, 'name': 'You'},
    {'img': SFAssetsPath.friendPNG, 'name': 'Kathryn'},
    {'img': SFAssetsPath.friend2PNG, 'name': 'Annette'},
    {'img': SFAssetsPath.friendPNG, 'name': 'Kathryn'},
    {'img': SFAssetsPath.friend2PNG, 'name': 'Annette'},
  ];

  int _selectedIndex = -1;
  Map<int, Color> _selectedColors = {};

  @override
  Widget build(BuildContext context) {
    final dark = SFAppTheme.isDarkMode(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor:
          dark ? SFColors.darkBackgroundColor : SFColors.liteBackgroundColor,
      appBar: AppBar(
        flexibleSpace: Container(
          color: dark
              ? const Color(0xFF1D2939)
              : SFColors.white, // Set the background color explicitly
        ),
        leadingWidth: 50,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Image.asset(
            SFAssetsPath.personPNG,
          ),
        ),
        title: AppTitle(),
        centerTitle: true,
        actions: [
          Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: dark ? null : SFColors.bottomNavActiveColor,
                shape: BoxShape.circle,
              ),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => NotificationScreen());
                },
                child: const Icon(
                  Iconsax.notification,
                  size: 20,
                ),
              )),
          const SizedBox(
            width: 10.0,
          ),
          Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: dark ? null : SFColors.bottomNavActiveColor,
                shape: BoxShape.circle,
              ),
              child: GestureDetector(
                onTap: () {
                  //Get.to(() => const OtherUsersProfileScreen());
                },
                child: const Icon(
                  Iconsax.messages_2,
                  size: 20,
                ),
              )),
          const SizedBox(
            width: 10.0,
          ),
          Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: dark ? null : SFColors.bottomNavActiveColor,
                shape: BoxShape.circle,
              ),
              child: GestureDetector(
                onTap: () {
                  loginController.signOut();
                },
                child: const Icon(
                  Iconsax.logout,
                  size: 20,
                ),
              )),
          const SizedBox(
            width: 16.0,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Get.isDarkMode
                  ? SFColors.darkCardBackgroundColor
                  : SFColors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, top: 16, bottom: 16, right: 8),
                child: SizedBox(
                  height: 182,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: storyItems.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          print(index);
                          _selectedIndex = index;
                          _selectedColors[_selectedIndex] =
                              SFColors.storyLiveColor;
                          //chat screen load when click on any friend's profile
                          if (_selectedIndex != 0) {
                            Get.to(
                              () => ChatScreen(
                                userName: storyItems[_selectedIndex]['name']!,
                                image: storyItems[_selectedIndex]['img']!,
                              ),
                            );
                          }

                          setState(() {});
                        },
                        child: Card(
                          elevation: 0,
                          margin: EdgeInsets.zero,
                          color: dark
                              ? SFColors.darkCardBackgroundColor
                              : SFColors.storyCardColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                  color: Colors.grey.withOpacity(0.2),
                                  width: 1)),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Image.asset(
                                    storyItems[index]['img']!,
                                    height: 150,
                                  ),
                                  if (index == 0)
                                    const Positioned(
                                      top: 60,
                                      left: 40,
                                      child: Icon(
                                        Icons.add,
                                        color: SFColors.white,
                                        size: 35,
                                      ),
                                    ),
                                  Positioned(
                                    top: 5,
                                    left: 5,
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: _selectedColors
                                                      .containsKey(index)
                                                  ? SFColors.storyLiveColor
                                                  : SFColors.buttonActiveColor,
                                              width: 2),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  storyItems[index]['img']!),
                                              fit: BoxFit.cover,
                                              onError: (Object, StackTrace) {
                                                const Icon(Icons.image);
                                              })),
                                      //child: ,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 14.0,
                              ),
                              Text(
                                storyItems[index]['name']!,
                                style: TextStyle(
                                  color:
                                      dark ? SFColors.white : Color(0xFF1D2939),
                                  fontSize: 12,
                                  // fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w600,
                                  height: 0.12,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 8,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.separated(
                shrinkWrap: true,
                primary: false,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    height: 450,
                    decoration: BoxDecoration(
                      color: dark
                          ? SFColors.darkCardBackgroundColor
                          : SFColors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: UploadCardWidget(),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
