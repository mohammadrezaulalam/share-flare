import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:share_flare/presentation/ui/utilities/assets_path.dart';
import 'package:share_flare/presentation/ui/utilities/colors.dart';
import 'package:share_flare/presentation/ui/utilities/theme/theme.dart';

class CommentListTileWidget extends StatefulWidget {
  @override
  _CommentListTileWidgetState createState() => _CommentListTileWidgetState();
}

class _CommentListTileWidgetState extends State<CommentListTileWidget> {
  bool _heartInTap = false;

  @override
  Widget build(BuildContext context) {
    final dark = SFAppTheme.isDarkMode(context);
    return ListTile(
      titleAlignment: ListTileTitleAlignment.top,
      leading: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(SFAssetsPath.personPNG),
            fit: BoxFit.cover,
            onError: (Object, StackTrace) {
              const Icon(Icons.image);
            },
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'mferdous12',
                style: TextStyle(
                  color: dark ? SFColors.white : Color(0xFF1D2939),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  height: 0.14,
                ),
              ),
              SizedBox(width: 12.0,),
              SizedBox(
                width: 80,
                child: Text(
                  '2 hours ago',
                  style: TextStyle(
                    color: dark ? SFColors.white : Color(0xFF98A2B3),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    height: 0.14,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 12.0,),
          Text(
            'Nice picture you have captured 🔥 ',
            style: TextStyle(
              color: dark ? SFColors.white :  Color(0xFF1D2939),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1,
            ),
          ),
          SizedBox(height: 16.0,),
          Text(
            'Replay',
            style: TextStyle(
              color: dark ? SFColors.white.withOpacity(0.6) : Color(0xFF475467),
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0.12,
            ),
          ),
        ],
      ),
      trailing: GestureDetector(
        onTap: () {
          setState(() {
            _heartInTap = !_heartInTap;
          });
        },
        child: _heartInTap
            ? const Icon(Iconsax.heart5, size: 20, color: SFColors.heartRedColor)
            : const Icon(Iconsax.heart, size: 20),
      ),
    );
  }
}