import 'package:csspt_app/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.inputType = TextInputType.text,
  });

  final TextEditingController controller;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      textInputAction: TextInputAction.next,
      textCapitalization: TextCapitalization.words,
      textAlignVertical: TextAlignVertical.bottom,
      showCursor: true,
      cursorColor: kCursorColor,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kFocusedTextFieldColor)
        ),
      ),
      style: kLabelTextStyle,
    );
  }
}
