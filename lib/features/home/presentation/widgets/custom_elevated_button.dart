import 'package:csspt_app/constants.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key, required this.text, required this.onPressed});

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: kBorderRadius,
          boxShadow: kBoxShadowList,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: SizedBox(
            width: 250,
            height: 45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 3,
                backgroundColor: kButtonBackgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: kBorderRadius,
                ),
              ),
              onPressed: onPressed,
              child: Text(
                text,
                style: kButtonTextStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
