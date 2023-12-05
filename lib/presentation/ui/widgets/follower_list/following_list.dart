import 'package:flutter/material.dart';
import 'package:share_flare/presentation/ui/widgets/round_divider.dart';



class FollowingListTap extends StatefulWidget {
  const FollowingListTap({super.key});

  @override
  State<FollowingListTap> createState() => _FollowingListTapState();
}

class _FollowingListTapState extends State<FollowingListTap> {
  UserData user = UserData(isFollowedByMe: false);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Row(
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
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Md Shagor",
                    style: TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.w600),),
                  SizedBox(
                    height: 0,
                  ),
                  RoundDivider(),
                  Text(
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
                width: 50,
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
        ),

      ],
    );
  }
}

class UserData {
  bool isFollowedByMe;

  UserData({required this.isFollowedByMe});
}
