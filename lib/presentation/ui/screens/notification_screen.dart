import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_flare/presentation/ui/utilities/colors.dart';
import 'package:share_flare/presentation/ui/utilities/theme/theme.dart';
import 'package:share_flare/presentation/ui/widgets/notification/custom_follow_notification.dart';
import 'package:share_flare/presentation/ui/widgets/notification/custom_like_notification.dart';

class NotificationScreen extends StatefulWidget {
   NotificationScreen({super.key});

 final List<String> newItem = ["liked", "follow"];

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final dark = SFAppTheme.isDarkMode(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
            flexibleSpace: Container(
              color: dark ? const Color(0xFF1D2939) : SFColors.white, // Set the background color explicitly
            ),
            backgroundColor: dark ? const Color(0xFF1D2939) : SFColors.white,
            title: Text(
              'Notification',
              style: TextStyle(
                  color: dark ? SFColors.white : const Color(0xFF1D2939)),
            ),
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: dark ? SFColors.white : const Color(0xFF1D2939),
              ),
            )),
      ),
      body: ListView.builder(
          shrinkWrap: false,
          itemCount: 15,
          itemBuilder: (context, int index) {
            return index % 3 == 2
                ? const CustomFollowNotification()
                : CustomLikeNotification(context);
          }),
    );
  }
}
