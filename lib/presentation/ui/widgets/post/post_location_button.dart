import 'package:flutter/material.dart';
import 'package:share_flare/presentation/ui/utilities/colors.dart';
import 'package:share_flare/presentation/ui/utilities/theme/theme.dart';
import 'package:share_flare/presentation/ui/widgets/round_divider.dart';

class PostLocationButton extends StatefulWidget {
  const PostLocationButton({super.key});

  @override
  State<PostLocationButton> createState() => _PostLocationButtonState();
}

class _PostLocationButtonState extends State<PostLocationButton> {
  @override
  Widget build(BuildContext context) {
    final dark = SFAppTheme.isDarkMode(context);
    return

      Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Container(
        width: 104,

        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: const Center(
          child: Text(
            'Multiple Select',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

            ),
      );
  }
}
