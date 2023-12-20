import 'package:advanced_login/consts/consts.dart';
import 'package:advanced_login/providers/auth.providers.dart';
import 'package:advanced_login/services/prefrences.services.dart';
import 'package:advanced_login/widgets/applogo.dart';
import 'package:advanced_login/widgets/custom_button.dart';
import 'package:advanced_login/widgets/custom_textfield.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final prefsFile = PrefrencesService.prefs;
  @override
  Widget build(BuildContext context) {
    double height = context.screenHeight;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgColor,
      body: BlurryModalProgressHUD(
            inAsyncCall: Provider.of<AuthController>(context).isLoading,
            blurEffectIntensity: 4,
            // progressIndicator: SpinKitFadingCircle(
            //   color: purpleColor,
            //   size: 90.0,
            // ),
            dismissible: true,
            opacity: 0.4,
            color: Colors.black87  ,
        child: SingleChildScrollView(
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
                Form(
                  key: _globalKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        title: email,
                        hint: emailHint,
                        controller: emailController,
                        icon: Icons.email,
                        isPass: false,
                        onClick: (value) {
                          emailController.text = value!;
                        },
                      ),
                      CustomTextField(
                        title: password,
                        hint: passwordHint,
                        controller: passwordController,
                        icon: Icons.lock,
                        isPass: true,
                        onClick: (value) {
                          passwordController.text = value!;
                        },
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
                        onPress: () async {
                          final authController = Provider.of<AuthController>(context, listen: false);
                          authController.changeisLoading(true);
                          if (_globalKey.currentState!.validate()) {
                            _globalKey.currentState?.save();
                            try {
                              String? emailValue = prefsFile!.getString('email');
                              String? passwordValue = prefsFile!.getString('password');
      
                              if (emailValue == null && passwordValue == null) {
                                authController.changeisLoading(false);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(errorNullloggedIn)));
                              }if (emailValue != emailController.text ||
                                  passwordValue != passwordController.text) {
                                authController.changeisLoading(false);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(errorloggedIn)));
                                authController.changeisLoading(false);
                              } else {
                               prefsFile!.setBool('login',true);
                               authController.changeisLoading(false);
                              VxToast.show(context, msg: loggedIn);
                              Navigator.pushReplacementNamed(context, 'HomepageScreen/');
                              }
                            } catch (e) {
                              print(e.toString());
                              authController.changeisLoading(false);
                            }
                          } else {
                            authController.changeisLoading(false);
                          }
                        },
                      ).box.width(context.screenWidth - 50).make(),
                      10.heightBox,
                      creatNewAccount.text.color(fontGrey).make(),
                      10.heightBox,
                      CustomButton(
                        bgColor: lightGolden,
                        textColor: PKColor,
                        title: signup,
                        onPress: () {
                          Navigator.pushNamed(context, 'SignupScreen/');
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
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
