import 'package:flutter/material.dart';
import 'package:share_flare/presentation/ui/widgets/round_divider.dart';

Widget ownProfileHeaderWidget(BuildContext context) {
  return Container(
    width: double.infinity,
    decoration: const BoxDecoration(color: Colors.white),
    child: const Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 45,
                backgroundColor: Color(0xFFFFEB3B),
              ),
              SizedBox(
                width: 6,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Jhon Doe",
                    style: TextStyle(
                      letterSpacing: 0.4,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "@jhon324",
                    style: TextStyle(
                      letterSpacing: 0.4,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
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
                ],
              )
            ],
          ),
        ],
      ),
    ),
  );
}
