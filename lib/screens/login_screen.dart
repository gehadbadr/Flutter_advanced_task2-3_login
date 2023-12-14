import 'package:advanced_login/consts/consts.dart';
import 'package:advanced_login/screens/signup_screen.dart';
import 'package:advanced_login/widgets/applogo.dart';
import 'package:advanced_login/widgets/custom_button.dart';
import 'package:advanced_login/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              "Log in to ${appname}"
                  .text
                  .fontFamily(bold)
                  .color(PKColor)
                  .size(18)
                  .make(),
              20.heightBox,
              Column(
                children: [
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
                  Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                          onPressed: () {}, child: forgetPass.text.make())),
                  5.heightBox,
                  CustomButton(
                    bgColor: PKColor,
                    textColor: whiteColor,
                    title: login,
                    onPress: () {},
                  ).box.width(context.screenWidth - 50).make(),
                  10.heightBox,
                  creatNewAccount.text.color(fontGrey).make(),
                  10.heightBox,
                  CustomButton(
                    bgColor: lightGolden,
                    textColor: PKColor,
                    title: signup,
                    onPress: () {
                      Navigator.pushNamed(context,'SignupScreen/');
                    },
                  ).box.width(context.screenWidth - 50).make(),
                  10.heightBox,
                  loginWith.text.color(fontGrey).make(),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        3,
                        (index) => Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: CircleAvatar(
                                  backgroundColor: lightGrey,
                                  radius: 25,
                                  child: Image.asset(
                                    socialIconList[index],
                                    width: 30,
                                  )),
                            )),
                  )
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
