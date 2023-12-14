import 'package:advanced_login/consts/consts.dart';
import 'package:advanced_login/widgets/applogo.dart';
import 'package:advanced_login/widgets/custom_button.dart';
import 'package:advanced_login/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  bool? isCheck = false;
  @override
  Widget build(BuildContext context) {
    double height = context.screenHeight;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              (height * 0.1).heightBox,
              appLogoWidget(),
              10.heightBox,
              "Join to ${appname}"
                  .text
                  .fontFamily(bold)
                  .color(PKColor)
                  .size(18)
                  .make(),
              20.heightBox,
              Column(
                children: [
                  CustomTextField(
                    title: name,
                    hint: nameHint,
                    isPass: false,
                    icon: Icons.person,
                  ),
                  CustomTextField(
                    title: email,
                    hint: emailHint,
                    icon: Icons.email,
                    isPass: false,
                  ),
                  CustomTextField(
                    title: password,
                    hint: passwordHint,
                    icon: Icons.lock,
                    isPass: true,
                  ),
                  CustomTextField(
                    title: repassword,
                    hint: repasswordHint,
                    icon: Icons.lock,
                    isPass: true,
                  ),
                  10.heightBox,
                  Row(
                    children: [
                      Checkbox(
                        value: isCheck,
                        onChanged: (value) {
                        /*  setState(() {
                            isCheck = value;
                            print(isCheck);
                          });*/
                        },
                        checkColor: PKColor,
                        activeColor: whiteColor,
                      ),
                      5.widthBox,
                      Expanded(
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "I agree to the ",
                                style: TextStyle(
                                    fontFamily: regular, color: fontGrey)),
                            TextSpan(
                                text: termAndCond,
                                style: TextStyle(
                                    fontFamily: bold, color: PKColor)),
                            TextSpan(
                                text: " & ",
                                style: TextStyle(
                                    fontFamily: regular, color: fontGrey)),
                            TextSpan(
                                text: privacyPolicy,
                                style:
                                    TextStyle(fontFamily: bold, color: PKColor))
                          ]),
                        ),
                      ),
                    ],
                  ),
                  10.heightBox,
                  CustomButton(
                    bgColor: PKColor,
                    textColor: whiteColor,
                    title: signup,
                    onPress: () {},
                  ).box.width(context.screenWidth - 50).make(),
                  10.heightBox,
                  10.heightBox,
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: alreadyHaveAccount,
                          style: TextStyle(fontFamily: bold, color: fontGrey)),
                      TextSpan(
                          text: login,
                          style: TextStyle(fontFamily: bold, color: PKColor))
                    ]),
                  ).onTap(() {
                    Navigator.pushNamed(context, 'LoginScreen/');
                  }),
                  10.heightBox,
                ],
              )
                  .box
                  .white
                  .rounded
                  .padding(EdgeInsets.all(16))
                  .width(context.screenWidth - 70)
                  .shadowSm
                  .make(),
            ],
          ),
        )),
      ),
    );
  }
}
