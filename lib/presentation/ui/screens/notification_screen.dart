import 'package:flutter/material.dart';
import 'package:share_flare/presentation/ui/widgets/notification/custom_follow_notification.dart';
import 'package:share_flare/presentation/ui/widgets/notification/custom_like_notification.dart';

class NotificationScreen extends StatefulWidget {
 NotificationScreen({super.key});


   List<String> newItem = ["liked", "follow"];


  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              'Notification',
              style: TextStyle(color: Colors.black),
            ),
            elevation: 0,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black54,
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
