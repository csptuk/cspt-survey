import 'package:csspt_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Radio<String>(
            value: value,
            groupValue: groupValue,
            toggleable: true,
            onChanged: (value) {
              HapticFeedback.lightImpact();
              onChanged(value);
            },
            activeColor: kActiveButtonColor,
          ),
        ),
        GestureDetector(
          onTap: () {
            HapticFeedback.lightImpact();
            if (value != groupValue) {
              onChanged(value);
            } else {
              onChanged(null);
            }
          },
          child: Text(
            label,
            style: kLabelTextStyle,
          ),
        ),
      ],
    );
  }
}
