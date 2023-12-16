import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_flare/presentation/ui/screens/own_profile_screen.dart';
import 'package:share_flare/presentation/ui/utilities/colors.dart';

import '../../state_holders/profile_search_controller.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchTEController = TextEditingController();
  bool isShowUser = false;

  final searchController = Get.find<ProfileSearchController>().userProfile;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        //backgroundColor: Get.isDarkMode? SFColors.black : SFColors.white,
        toolbarHeight: 100,
        //title: const CustomSearchBar(),
        title: Container(
          //color: Get.isDarkMode? SFColors.black : SFColors.white,
          width: double.infinity,
          child: TextFormField(
            controller: searchTEController,
            decoration: InputDecoration(
              //labelText: 'Search',
              contentPadding: const EdgeInsets.symmetric(vertical: 15),
              hintText: 'Search',
              hintStyle: const TextStyle(color: SFColors.searchIconTextColor),
              prefixIcon: Icon(Icons.search,
                  color: Get.isDarkMode
                      ? SFColors.searchIconTextColorDark
                      : SFColors.searchIconTextColor),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.1,
                  color: Get.isDarkMode
                      ? SFColors.textInputFieldInactiveBorderColorDark
                      : SFColors.textInputFieldInactiveBorderColor,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1.5,
                  color: SFColors.chatActiveColor,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onFieldSubmitted: (String _) {
              setState(() {
                isShowUser = true;
              });
              // print(_);
              // print(searchTEController.text);
            },
          ),
        ),
      ),
      body: isShowUser
          ? FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('users')
                  .where(
                    'userName',
                    isGreaterThanOrEqualTo: searchTEController.text,
                  )
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                    itemCount: (snapshot.data! as dynamic).docs.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Get.to(() => OwnProfileScreen(
                            uid: (snapshot.data! as dynamic).docs[index]
                                ['uid'])),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                (snapshot.data! as dynamic).docs[index]
                                    ['profilePhoto']),
                          ),
                          title: Text((snapshot.data! as dynamic).docs[index]
                              ['userName']),
                        ),
                      );
                    });
              },
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Obx(
                () => GridView.builder(
                    itemCount: searchController.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            'https://cdn.pixabay.com/photo/2013/10/02/23/03/mountains-190055_640.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    }),
              ),
            ),
    );
  }
}
