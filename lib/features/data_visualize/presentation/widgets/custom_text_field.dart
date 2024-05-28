import 'package:csspt_app/constants.dart';
import 'package:flutter/cupertino.dart';
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
    return Focus(
      focusNode: focusNode,
      onFocusChange: (hasFocus) {
        // print(
        //     "focus ${focusNode.debugLabel} ${focusNode.hasPrimaryFocus} ${focusNode.children.first.hasPrimaryFocus}");
        // // if (focusNode.hasFocus & !focusNode.children.first.hasPrimaryFocus) {
        // //   print("node: ${focusNode.debugLabel} given child focus");
        // }
        if (!hasFocus) {
          onFocusChange(controller.text);
        }
        if (focusNode.hasPrimaryFocus) {
          focusNode.children.first.requestFocus();
        }
      },
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        textInputAction: TextInputAction.next,
        textCapitalization: TextCapitalization.words,
        textAlignVertical: TextAlignVertical.top,
        validator: validator,
        focusNode: FocusNode(debugLabel: "${focusNode.debugLabel}_text"),
        onTapOutside: (_) {
          focusNode.unfocus();
          onFocusChange(controller.text);
        },
        onFieldSubmitted: (_) {
          // focusNode.nearestScope?.descendants.forEach((node) {
          //   print("before: ${node}");
          // });
          // // int? index = focusNode.nearestScope?.descendants.toList().indexWhere((node) => node.hasPrimaryFocus);
          // // focusNode.nearestScope?.descendants.elementAt(index! + 1).children.first.requestFocus();
          // focusNode.nearestScope?.descendants.firstWhere((node) =>
          // node.debugLabel ==
          //     "${int.parse(focusNode.debugLabel!) + 1}").requestFocus();
          // FocusNode? nextNode = focusNode.nearestScope?.descendants.first;
          // FocusScope.of(context).requestFocus(nextNode);
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
