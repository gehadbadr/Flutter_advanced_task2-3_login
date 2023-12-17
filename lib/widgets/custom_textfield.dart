import 'package:flutter/material.dart';
import 'package:advanced_login/consts/consts.dart';
import 'package:email_validator/email_validator.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final String title;
  final TextEditingController? controller;
  final Function(String?)? onClick;
  final IconData icon;
  final bool isPass;
  CustomTextField(
      {super.key,
      required this.title,
      required this.hint,
      required this.icon,
      required this.isPass,
      this.controller,
      this.onClick});

  void mail() {
    const String email = 'fredrik.eilertsen@gail.com';
    final bool isValid = EmailValidator.validate(email);
    print('Email is valid? ' + (isValid ? 'yes' : 'no'));
  }

  String? errorMessage(String str) {
    switch (hint) {
      case 'Name':
        return 'Name is required';
      case 'admin@admin.com':
        return 'Email is required';
      case 'Password':
        return 'Password is required';
      case 'RePassword':
        return 'RePassword is required ';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      10.heightBox,
      title.text.fontFamily(semibold).color(PKColor).size(16).make(),
      5.heightBox,
      TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return errorMessage(hint);
          }
          if (title == email) {
            return EmailValidator.validate(value) ? null : "Please enter a valid email";
          }
        },
        onSaved: onClick,
        obscureText: isPass,
        controller: controller,
        decoration: InputDecoration(
            hintStyle: TextStyle(fontFamily: semibold, color: textfieldGrey),
            hintText: hint,
            isDense: true,
            fillColor: lightGrey,
            prefixIcon: Icon(
              icon,
              color: PKColor,
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
