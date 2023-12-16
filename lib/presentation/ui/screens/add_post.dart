// import 'dart:typed_data';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:share_flare/presentation/ui/utilities/colors.dart';
// import 'package:share_flare/presentation/ui/utilities/theme/theme.dart';
// import 'package:share_flare/presentation/ui/utilities/utiles.dart';
//
// import 'post_screen.dart';
//
// class AddPostScreen extends StatefulWidget {
//   const AddPostScreen({Key? key}) : super(key: key);
//
//   @override
//   State<AddPostScreen> createState() => _AddPostScreenState();
// }
//
// class _AddPostScreenState extends State<AddPostScreen> {
//   final List<Uint8List> _imageList = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadGalleryImages();
//   }
//
//   _loadGalleryImages() async {
//     // Open the gallery and get the list of selected images
//     List<Uint8List> galleryImages = await _pickMultipleImagesFromGallery();
//
//     setState(() {
//       _imageList.addAll(galleryImages); // Add the selected images to the list
//     });
//   }
//
//   Future<List<Uint8List>> _pickMultipleImagesFromGallery() async {
//     List<Uint8List> selectedImages = [];
//
//     // Use ImagePicker to pick multiple images from the gallery
//     List<XFile>? galleryFiles = await ImagePicker().pickMultiImage();
//
//     if (galleryFiles != null) {
//       for (XFile file in galleryFiles) {
//         // Read the image file and add it to the list
//         List<int> bytes = await file.readAsBytes();
//         selectedImages.add(Uint8List.fromList(bytes));
//       }
//     }
//
//     return selectedImages;
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     final dark = SFAppTheme.isDarkMode(context);
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(60),
//         child: AppBar(
//           flexibleSpace: Container(
//             color: dark
//                 ? const Color(0xFF1D2939)
//                 : SFColors.white, // Set the background color explicitly
//           ),
//           backgroundColor: dark ? const Color(0xFF1D2939) : SFColors.white,
//           title: Text(
//             'New Post',
//             style: TextStyle(
//                 color: dark ? SFColors.white : const Color(0xFF1D2939),
//                 fontWeight: FontWeight.w600),
//           ),
//           elevation: 0,
//           leading: IconButton(
//             onPressed: () {
//               Get.back();
//             },
//             icon: Icon(
//               Icons.arrow_back_ios_new_outlined,
//               color: dark ? SFColors.white : const Color(0xFF1D2939),
//               size: 25,
//             ),
//           ),
//           actions: [
//             Padding(
//               padding: const EdgeInsets.only(right: 16),
//               child: GestureDetector(
//                 onTap: () {
//                   Get.to(() => const PostScreen());
//                 },
//                 child: const Row(
//                   children: [
//                     Text(
//                       'Next',
//                       style: TextStyle(
//                           color: Color(0xFF4478FF),
//                           fontWeight: FontWeight.w600),
//                     ),
//                     SizedBox(
//                       width: 4,
//                     ),
//                     Icon(
//                       Icons.arrow_forward_ios,
//                       size: 18,
//                       color: Color(0xFF4478FF),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 370,
//                 child: GridView.builder(
//                   itemCount:  _imageList.length,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 1,
//                     mainAxisSpacing: 1,
//                     crossAxisSpacing: 1,
//                   ),
//                   itemBuilder: (context, index) {
//                     return Image.memory(
//                       _imageList[index], // Display the image from the list
//                       fit: BoxFit.cover,
//                     );
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 16.0, right: 16.0),
//                 child: Container(
//                   width: double.infinity,
//                   height: 40,
//                   color: Colors.white,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Row(
//                         children: [
//                           Text(
//                             'Recent photos',
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.w600),
//                           ),
//                           Icon(
//                             Icons.keyboard_arrow_down_rounded,
//                             size: 35,
//                             weight: 10,
//                             opticalSize: 4,
//                             color: Colors.black87,
//                           )
//                         ],
//                       ),
//                       Container(
//                         width: 118,
//                         decoration: BoxDecoration(
//                           color: Colors.grey[200],
//                           borderRadius: BorderRadius.circular(4.0),
//                         ),
//                         child: const Center(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.paste,
//                                 size: 15,
//                                 color: Colors.black87,
//                               ),
//                               SizedBox(width: 2),
//                               Text(
//                                 'Multiple Select',
//                                 style: TextStyle(
//                                   fontSize: 13,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               // SingleChildScrollView(
//               //   child: Padding(
//               //     padding: const EdgeInsets.only(top: 8.0),
//               //     child:Container(
//               //       child: Row(
//               //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               //         children:
//               //
//               //         List.generate(
//               //           _imageList.length,
//               //               (index) =>
//               //             Container(
//               //               width: 100,
//               //               height: 100,// Set width as needed
//               //               // Set height as needed
//               //               color: Colors.blue, // Set color or decoration as needed
//               //               alignment: Alignment.center,
//               //               child:Image.asset(
//               //                 'assets/images/img_11.png',
//               //                 fit: BoxFit.cover,
//               //               ),
//               //             ),
//               //           ),
//               //         ),
//               //       ),
//               //     ),
//               //   ),
//
//
//               // SingleChildScrollView(
//               //   child: Padding(
//               //     padding: const EdgeInsets.only(top: 8.0),
//               //     child:
//               //     Container(
//               //       child: GridView.builder(
//               //           shrinkWrap: true,
//               //           itemCount: 9,
//               //           gridDelegate:
//               //               const SliverGridDelegateWithFixedCrossAxisCount(
//               //             crossAxisCount: 3,
//               //             mainAxisSpacing: 0,
//               //             crossAxisSpacing: 0,
//               //           ),
//               //           itemBuilder: (context, index) {
//               //             return GestureDetector(
//               //                 onTap:  () async {
//               //                   Navigator.of(context).pop();
//               //                   Uint8List file = await pickImage(ImageSource.gallery);
//               //                   setState(() {
//               //
//               //                   });}
//               //
//               //             );
//               //           }),
//               //     ),
//               //   ),
//               // )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // GridView.builder(
// //     shrinkWrap: true,
// //     itemCount: 9,
// //     gridDelegate:
// //         const SliverGridDelegateWithFixedCrossAxisCount(
// //       crossAxisCount: 3,
// //       mainAxisSpacing: 0,
// //       crossAxisSpacing: 0,
// //     ),
// //     itemBuilder: (context, index) {
// //       return Image.asset(
// //         'assets/images/img_11.png',
// //         fit: BoxFit.cover,
// //       );
// //     }),
