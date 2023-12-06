import 'package:flutter/material.dart';
import 'package:share_flare/presentation/ui/utilities/colors.dart';
import 'package:share_flare/presentation/ui/utilities/theme/theme.dart';



class CustomFollowNotification extends StatefulWidget {
  const CustomFollowNotification({super.key});

  @override
  State<CustomFollowNotification> createState() => _CustomFollowNotificationState();
}

class _CustomFollowNotificationState extends State<CustomFollowNotification> {
  UserData user = UserData(isFollowedByMe: false);


  @override
  Widget build(BuildContext context) {
    final dark = SFAppTheme.isDarkMode(context);
    return Container(
      width: double.infinity,
      decoration:  BoxDecoration(color: dark ? const Color(0xFF1D2939) : SFColors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            thickness: 1,
            color: dark ? SFColors.darkBackgroundColor : Colors.grey[200],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 21,
                  backgroundColor: Color(0xFFFFEB3B),
                ),

                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      maxLines: 2,
                      text:  TextSpan(
                          text: "Md Shagor,",
                          style: TextStyle(fontSize: 12, color: dark ? SFColors.white : const Color(0xFF1D2939), fontWeight: FontWeight.w400),
                          children: [
                            TextSpan(
                              text: " from your contacts is\n",
                              style: TextStyle(fontSize: 12, color: dark ? SFColors.white : const Color(0xFF1D2939), fontWeight: FontWeight.w400),
                            ),
                            TextSpan(text: "on instagram as",style: TextStyle(fontSize: 12, color: dark ? SFColors.white : const Color(0xFF1D2939), fontWeight: FontWeight.w400)),
                            TextSpan(text: " shagor2240", style: TextStyle(fontSize: 12, color: dark ? SFColors.white : const Color(0xFF1D2939), fontWeight: FontWeight.w400)),
                          ]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Last Monday at 9:43 AM",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),

                  ],
                ),
                const SizedBox(
                  width: 34,
                ),
                Expanded(
                  child:
                  GestureDetector(
                      onTap: (){
                        setState((){
                          user.isFollowedByMe= ! user.isFollowedByMe;
                        });
                      },
                      child: AnimatedContainer (duration: Duration(microseconds:  300), height: 35,
                        decoration: BoxDecoration(
                            color:  user.isFollowedByMe? Colors.grey[200] : Colors.blue,

                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: user.isFollowedByMe? Colors.white24 : Colors.transparent,)
                        ),
                        child: Center(
                          child: Text(user.isFollowedByMe? 'unfollow' : 'follow', style: TextStyle(color: user.isFollowedByMe? Colors.black: Colors.white,fontWeight: FontWeight.w500),),
                        ),
                      )


                  ),
                ),

              ],

            ),
          ),
        ],
      ),
    );
  }
}

class UserData {
  bool isFollowedByMe;

  UserData({required this.isFollowedByMe});
}
