import 'package:flutter/material.dart';
import 'package:advanced_login/consts/consts.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final String title;
  final IconData  icon;
  final bool isPass;
  CustomTextField({super.key,required this.title,required this.hint,required this.icon,required this.isPass});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      10.heightBox,
      title.text.fontFamily(semibold).color(PKColor).size(16).make(),
      5.heightBox,
      TextFormField(
        obscureText: isPass,
        decoration: InputDecoration(
            hintStyle: TextStyle(fontFamily: semibold, color: textfieldGrey),
            hintText: hint,
            isDense: true,
            fillColor: lightGrey,
            prefixIcon: Icon(icon, color: PKColor,
          ),
          filled: true,
            border: InputBorder.none,
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: PKColor))),
      ),
      5.heightBox,
    ]);
  }
}
