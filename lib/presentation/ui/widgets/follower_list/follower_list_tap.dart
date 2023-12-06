import 'package:flutter/material.dart';
import 'package:share_flare/presentation/ui/utilities/colors.dart';
import 'package:share_flare/presentation/ui/utilities/theme/theme.dart';
import 'package:share_flare/presentation/ui/widgets/round_divider.dart';



class FollowerListTap extends StatefulWidget {
  const FollowerListTap({super.key});

  @override
  State<FollowerListTap> createState() => _FollowerListTapState();
}

class _FollowerListTapState extends State<FollowerListTap> {
  UserData user = UserData(isFollowedByMe: false);


  @override
  Widget build(BuildContext context) {
    final dark = SFAppTheme.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.only(top:8, bottom: 8, left: 8.0, right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 19,
                backgroundColor: Color(0xFFFFEB3B),
              ),

              const SizedBox(
                width: 10,
              ),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Md Shagor",
                    style: TextStyle(fontSize: 14,  color: dark ? SFColors.white : const Color(0xFF1D2939), fontWeight: FontWeight.w600),),
                  const SizedBox(
                    height: 0,
                  ),
                  const RoundDivider(),
                  const Text(
                    "Follow",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),

                ],
              ),

              const SizedBox(
                width: 70,
              ),
              Expanded(
                child:
                GestureDetector(
                    onTap: (){
                      setState((){
                        user.isFollowedByMe= ! user.isFollowedByMe;
                      });
                    },
                    child: AnimatedContainer (duration: const Duration(microseconds:  300), height: 34,
                      decoration: BoxDecoration(
                          color:  Colors.grey[200] ,

                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color:  Colors.transparent,)
                      ),
                      child: const Center(
                        child: Text('Remove' , style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                      ),
                    )

                ),
              ),

            ],

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
