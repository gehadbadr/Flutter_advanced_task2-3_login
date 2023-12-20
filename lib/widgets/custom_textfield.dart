import 'package:advanced_login/providers/auth.providers.dart';
import 'package:flutter/material.dart';
import 'package:advanced_login/consts/consts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';

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
  //var modelHubcontroller = Provider.of<ModelHud>;
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
  final authController = Provider.of<AuthController>(context, listen: false);

  //  return Consumer<ModelHud>(builder: (context, viewModel, child) {
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
              return EmailValidator.validate(value)
                  ? null
                  :invalidEmail;
            }
            if(title == password && value.length < 6) {
               return weakPassword;                      
            }
          },
          onSaved: onClick,
          obscureText: isPass == false?false
                       :title == password ?authController.isTrue:authController.isConfirmPassword,
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
              suffixIcon:isPass== true ?
              title == password ?  InkWell(
                onTap: () {
                //  authController.toggleObscure(authController.obscureText);
                authController.toggleObs();
                },
                child: authController.switchConfirmPasswordIcon/*Icon(/*authController.obscureText == true
                    ? Icons.visibility_off
                    : Icons.visibility*/)*/,
              
              ): InkWell(
                onTap: () {
                //  authController.toggleObscure(authController.obscureText);
                authController.toggleObsData();
                },
                child: authController.switchPasswordIcon/*Icon(/*authController.obscureText == true
                    ? Icons.visibility_off
                    : Icons.visibility*/)*/,
              
              ):null ,
              // isPass== true ? obscureText! ?Icon(Icons.visibility_off, color: PKColor,):Icon(Icons.visibility, color: PKColor,)
              //: null  ,
              //isPass == true ?(Icons.visibility_off,):(Icons.visibility_off,),
              /*  suffixIcon:InkWell(
              onTap: ()=> toggleObscure(),
              child: Icon(obscureText! ?Icons.visibility_off:Icons.visibility),
            //   child:Icon(obscureText1
            //   ? Icon(Icons.visibility_off, color: PKColor,)
            //   :Icon(Icons.visibility, color: PKColor,),
            // )
            ),*/
              filled: true,
              border: InputBorder.none,
              focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: PKColor))),
        ),
        5.heightBox,
      ]);
  //  });
  }
}
