import 'package:flutter/material.dart';
import 'package:share_flare/presentation/ui/utilities/colors.dart';
import 'package:share_flare/presentation/ui/utilities/theme/theme.dart';
import 'package:share_flare/presentation/ui/widgets/round_divider.dart';

class PostMusicButton extends StatefulWidget {
  const PostMusicButton({super.key});

  @override
  State<PostMusicButton> createState() => _PostMusicButtonState();
}

class _PostMusicButtonState extends State<PostMusicButton> {
  @override
  Widget build(BuildContext context) {
    final dark = SFAppTheme.isDarkMode(context);
    return

      Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Container(
        width: 124,

        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.multitrack_audio, size: 15,  color: Colors.black87,),
              SizedBox(width: 2),
              Text(
                'Multiple Select',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

            ),
      );
  }
}
