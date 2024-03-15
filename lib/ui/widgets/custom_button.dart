import 'package:appdua/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double widht;
  final Function() onPressed;
  final EdgeInsets margin;

  const CustomButton({super.key, required this.title, this.widht=double.infinity, required this.onPressed, this.margin=EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widht,
      height: 55,
      margin: margin,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: kprimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
          ),
          child: Text(
            title,
            style: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
            ),
          )),
    );
  }
}
