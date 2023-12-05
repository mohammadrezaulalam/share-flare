import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CommentTextFieldWidget extends StatefulWidget {
  CommentTextFieldWidget({Key? key}) : super(key: key);

  @override
  State<CommentTextFieldWidget> createState() => _CommentTextFieldWidgetState();
}

class _CommentTextFieldWidgetState extends State<CommentTextFieldWidget> {
  TextEditingController _commentTEController = TextEditingController();

  bool _changeText = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _commentTEController,
      onChanged: (String value) {
        if (value.isNotEmpty) {
          _changeText = true;
        } else {
          _changeText = false;
        }
        setState(() {});
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
            vertical: 4, horizontal: 16.0),
        hintText: 'Add comments',
        hintStyle: const TextStyle(
          color: Color(0xFF98A2B3),
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 0.10,
        ),
        border: const OutlineInputBorder(
          borderSide:BorderSide.none,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            _commentTEController.clear();
            _changeText = false;
            setState(() {});
          },
          child: SizedBox(
            width: 15.0,
            height: 14.0,
            child: Center(
              child: _changeText == true
                  ? Icon(Iconsax.send_1)
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}