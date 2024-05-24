import 'package:csspt_app/constants.dart';
import 'package:flutter/material.dart';

class CustomCheckboxListTile extends StatelessWidget {
  const CustomCheckboxListTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final bool value;
  final Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(title, style: kLabelTextStyle,),
      value: value,
      dense: true,
      enableFeedback: true,
      activeColor: kActiveButtonColor,
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: onChanged,
    );
  }
}
