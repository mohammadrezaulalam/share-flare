import 'package:flutter/material.dart';
import 'package:share_flare/presentation/ui/widgets/round_divider.dart';

Widget profileHeaderWidget(BuildContext context) {
  return Container(
    width: double.infinity,
    decoration: const BoxDecoration(color: Colors.white),
    child: Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xFFFFEB3B),
              ),
              const SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            "23",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            "Posts",
                            style: TextStyle(
                              fontSize: 10,
                              letterSpacing: 0.4,
                            ),
                          )
                        ],
                      ),
                      RoundDivider(),
                      Row(
                        children: [
                          Text(
                            "125",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            "Following",
                            style: TextStyle(
                              letterSpacing: 0.4,
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                      RoundDivider(),
                      Row(
                        children: [
                          Text(
                            "234",
                            style: TextStyle(
                              letterSpacing: 0.4,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            "Follower",
                            style: TextStyle(
                              letterSpacing: 0.4,
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Text(
                    "Visit: www.ostad.app",
                    style: TextStyle(
                      letterSpacing: 0.4,
                      fontSize: 12,
                    ),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Add your follow button logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          // Set the button color to light grey
                          minimumSize: const Size(60, 30),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  4)), // Set the minimum size of the button
                        ),
                        child: const Text(
                          "Follow",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Add your follow button logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          // Set the button color to light grey
                          minimumSize: const Size(60, 30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          elevation: 0, // Set the minimum size of the button
                        ),
                        child: const Text(
                          "Message",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    ),
  );
}
