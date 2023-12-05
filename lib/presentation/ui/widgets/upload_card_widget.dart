import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:share_flare/presentation/ui/utilities/assets_path.dart';
import 'package:share_flare/presentation/ui/utilities/colors.dart';
import 'package:share_flare/presentation/ui/utilities/theme/theme.dart';
import 'package:share_flare/presentation/ui/widgets/comment_list_title_widges.dart';
import 'package:share_flare/presentation/ui/widgets/comment_text_field.dart';



class UploadCardWidget extends StatefulWidget {
  const UploadCardWidget({Key? key}) : super(key: key);

  @override
  State<UploadCardWidget> createState() => _UploadCardWidgetState();
}

class _UploadCardWidgetState extends State<UploadCardWidget> {

  bool _heartTap = false;
  bool _bookMarkTap = false;

  @override
  Widget build(BuildContext context) {
    final dark = SFAppTheme.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: const AssetImage(SFAssetsPath.personPNG),
                    fit: BoxFit.cover,
                    onError: (Object, StackTrace) {
                      const Icon(Icons.image);
                    },
                  ),
                ),
              ),
              const SizedBox(width: 10.0,),
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kathryn Annee',
                    style: TextStyle(
                      color: dark ? SFColors.white : SFColors.darkCardBackgroundColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      height: 0.07,
                    ),
                  ),
                  SizedBox(height: 16.0,),
                  Text(
                    '@anny2002',
                    style: TextStyle(
                      color: dark ? SFColors.darkContainerSubtitleColor : Color(0xFF475467),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 0.12,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                height: 35,
                width: 35,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.more_vert, size: 20,),
              ),
            ],
          ),
          const SizedBox(height: 8.0,),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              SFAssetsPath.uploadImagePNG,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  _heartTap = !_heartTap;
                  setState(() {});
                },
                child: _heartTap ? const Icon(Iconsax.heart5, size: 20, color: SFColors.heartRedColor,) : const Icon(Iconsax.heart, size: 20,),
              ),
              const SizedBox(width: 8,),
              GestureDetector(
                onTap: () {
                  _showBottomSheet(context);
                },
                child:  Row(
                  children: [
                    Icon(Iconsax.message, size: 20,),
                    SizedBox(width: 8,),
                    Text(
                      '20 comments',
                      style: TextStyle(
                        color: dark ? SFColors.white:  Color(0xFF101828),
                        fontSize: 14,
                        fontFamily: 'Satoshi',
                        fontWeight: FontWeight.w500,
                        height: 0.09,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              GestureDetector(
                  onTap: () {
                    _bookMarkTap = !_bookMarkTap;
                    setState(() {});
                  },
                  child: _bookMarkTap ? const Icon(Icons.bookmark, size: 21,) : const Icon(Icons.bookmark_border_outlined, size: 21,)),
            ],
          ),
          const SizedBox(height: 14.0,),
          Row(
            children: [
              Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: const AssetImage(SFAssetsPath.personPNG),
                    fit: BoxFit.cover,
                    onError: (Object, StackTrace) {
                      const Icon(Icons.image);
                    },
                  ),
                ),
              ),
              const SizedBox(width: 10.0,),
              Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _showBottomSheet(context);
                      setState(() {});
                    },
                    child: const SizedBox(
                      height: 15,
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Add comments',
                          style: TextStyle(
                            color: Color(0xFF98A2B3),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 0.10,
                          ),
                        ),
                      ),
                    ),
                  )
              )
            ],
          ),
        ],
      ),
    );
  }

  _showBottomSheet(BuildContext context) {
    final dark = SFAppTheme.isDarkMode(context);
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            ),
            child: SizedBox(
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 10.0,),
                  Container(
                    width: 40,
                    height: 4,
                    decoration: ShapeDecoration(
                      color: dark ? SFColors.white : Color(0xFF1D2939),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                   Text(
                    'Comment',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: dark ? SFColors.white : Color(0xFF1D2939),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 0.08,
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  Divider(color: Colors.grey.withOpacity(0.2),),
                  Expanded(
                    child: ListView.separated(
                        separatorBuilder: (context, index) =>
                        const SizedBox(height: 16.0,),
                        padding: EdgeInsets.zero,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return CommentListTileWidget();
                        }),
                  ),
                  Divider(color: Colors.grey.withOpacity(0.2),),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: const AssetImage(SFAssetsPath.personPNG),
                                fit: BoxFit.cover,
                                onError: (Object, StackTrace) {
                                  const Icon(Icons.image);
                                },
                              )
                          ),
                        ),
                        const SizedBox(width: 16.0,),
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: CommentTextFieldWidget(),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}



