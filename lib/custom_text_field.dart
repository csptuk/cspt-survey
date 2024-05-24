import 'package:csspt_app/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.inputType = TextInputType.text,
    required this.onFocusChange,
  });

  final TextEditingController controller;
  final TextInputType inputType;
  final Function(String) onFocusChange;

  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = FocusNode();

    return SizedBox(
      height: 40,
      child: Focus(
        onFocusChange: (hasFocus) {
          if (hasFocus) {
            if (!focusNode.hasFocus) {
              focusNode.requestFocus();
            }
          } else {
            onFocusChange(controller.text);
            focusNode.nextFocus();
          }
        },
        child: TextFormField(
          controller: controller,
          keyboardType: inputType,
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.words,
          textAlignVertical: TextAlignVertical.center,
          showCursor: true,
          focusNode: focusNode,
          cursorColor: kCursorColor,
          decoration: const InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kFocusedTextFieldColor),
            ),
          ),
          style: kLabelTextStyle,
        ),
      ),
    );
  }
}
