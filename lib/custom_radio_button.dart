import 'package:csspt_app/constants.dart';
import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    super.key,
    required this.value,
    required this.label,
    required this.groupValue,
    required this.onChanged,
  });

  final String value;
  final String label;
  final String groupValue;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<String>(
          value: value,
          groupValue: groupValue,
          toggleable: true,
          onChanged: onChanged,
          activeColor: kActiveRadioButtonColor,
        ),
        Text(label),
      ],
    );
  }
}
