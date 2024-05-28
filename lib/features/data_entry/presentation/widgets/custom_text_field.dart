import 'package:csspt_app/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    this.inputType = TextInputType.text,
    required this.onFocusChange,
    required this.validator,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputType inputType;
  final Function(String) onFocusChange;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    FocusNode childFocusNode =
        FocusNode(debugLabel: "${focusNode.debugLabel}_text");

    return Focus(
      focusNode: focusNode,
      onFocusChange: (hasFocus) {
        if (focusNode.hasPrimaryFocus) {
          childFocusNode.requestFocus();
        }
        if (!hasFocus) {
          onFocusChange(controller.text);
        }
      },
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        textInputAction: TextInputAction.next,
        textCapitalization: TextCapitalization.words,
        textAlignVertical: TextAlignVertical.top,
        validator: validator,
        focusNode: childFocusNode,
        onTapOutside: (_) {
          onFocusChange(controller.text);
        },
        onFieldSubmitted: (_) {
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
