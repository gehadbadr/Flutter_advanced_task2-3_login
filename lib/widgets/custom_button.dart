import 'package:advanced_login/consts/consts.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color? bgColor;
  final Color? textColor;
  final String? title;
  final Function()? onPress;
  const CustomButton(
      {super.key, this.bgColor, this.textColor, this.title, this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: bgColor!, padding: EdgeInsets.all(12)),
        onPressed:onPress,
        child: title!.text.color(textColor).fontFamily(bold).make());
  }
}
