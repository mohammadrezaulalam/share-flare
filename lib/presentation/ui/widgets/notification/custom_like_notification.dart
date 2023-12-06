import 'package:flutter/material.dart';
import 'package:share_flare/presentation/ui/utilities/colors.dart';
import 'package:share_flare/presentation/ui/utilities/theme/theme.dart';



Widget CustomLikeNotification(BuildContext context) {
  final dark = SFAppTheme.isDarkMode(context);
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(color: dark ? const Color(0xFF1D2939) : SFColors.white),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          thickness: 1,
          color: dark ? SFColors.darkBackgroundColor : Colors.grey[200]
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 19,
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
                    text: TextSpan(
                        text: "Dennis Nedry",
                        style: TextStyle(fontSize: 14, color: dark ? SFColors.white : const Color(0xFF1D2939), fontWeight: FontWeight.w600),
                        children:[
                          TextSpan(
                            text: " commented on",
                            style: TextStyle(fontSize: 14, color: dark ? SFColors.white : const Color(0xFF1D2939), fontWeight: FontWeight.w400),
                          ),
                          TextSpan(text: " Isla Nublar\n", style: TextStyle(fontSize: 14, color: dark ? SFColors.white : const Color(0xFF1D2939), fontWeight: FontWeight.w600), ),
                          TextSpan(text: "SOC2 compliance report", style: TextStyle(fontSize: 14, color: dark ? SFColors.white : const Color(0xFF1D2939), fontWeight: FontWeight.w600)),
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

            ],
          ),
        ),
      ],
    ),
  );
}


