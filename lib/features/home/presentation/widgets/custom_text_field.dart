import 'package:csspt_app/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.inputType = TextInputType.text,
    required this.onFocusChange,
    required this.validator,
  });

  final TextEditingController controller;
  final TextInputType inputType;
  final Function(String) onFocusChange;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = FocusNode();

    return Focus(
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
        textAlignVertical: TextAlignVertical.top,
        focusNode: focusNode,
        validator: validator,
        onTapOutside: (_) {
          onFocusChange(controller.text);
        },
        showCursor: true,
        cursorColor: kCursorColor,
        decoration: const InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kFocusedTextFieldColor),
          ),
        ),
        style: kLabelTextStyle,
      ),
    );
  }
}
