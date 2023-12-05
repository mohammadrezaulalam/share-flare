import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utilities/colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Get.isDarkMode? SFColors.black : SFColors.white,
      width: double.infinity,
      child: TextField(
        decoration: InputDecoration(
          //labelText: 'Search',
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          hintText: 'Search',
          hintStyle: const TextStyle(color: SFColors.searchIconTextColor),
          prefixIcon: Icon(Icons.search, color: Get.isDarkMode ? SFColors.searchIconTextColorDark : SFColors.searchIconTextColor),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.1,
              color: Get.isDarkMode ? SFColors.textInputFieldInactiveBorderColorDark : SFColors.textInputFieldInactiveBorderColor,
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
      ),
    );
  }
}