import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:share_flare/presentation/ui/utilities/colors.dart';

import '../../state_holders/profile_search_controller.dart';
import '../widgets/custom_search_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = Get.find<ProfileSearchController>().userProfile;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        //backgroundColor: Get.isDarkMode? SFColors.black : SFColors.white,
        toolbarHeight: 100,
        title: const CustomSearchBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Obx(
          ()=> GridView.builder(
            itemCount: searchController.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,

              ),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index){
            return Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(searchController[index], fit: BoxFit.fill,),
              ),
            );
          }),
        ),
      ),
    );
  }
}
