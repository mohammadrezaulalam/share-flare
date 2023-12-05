import 'package:flutter/material.dart';



Widget CustomLikeNotification(BuildContext context) {
  return Container(
    width: double.infinity,
    decoration: const BoxDecoration(color: Colors.white),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          thickness: 1,
          color: Colors.grey[200],
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
                    text: const TextSpan(
                        text: "Dennis Nedry",
                        style: TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.w600),
                        children: [
                          TextSpan(
                            text: " commented on",
                            style: TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.w400),
                          ),
                          TextSpan(text: " Isla Nublar\n"),
                          TextSpan(text: "SOC2 compliance report", style: TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.w600)),
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


