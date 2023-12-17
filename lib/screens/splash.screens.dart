import 'package:advanced_login/consts/consts.dart';
import 'package:advanced_login/services/prefrences.services.dart';
import 'package:advanced_login/widgets/applogo.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final prefsFile = PrefrencesService.prefs;

  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(seconds: 4), () {});
    bool? res = await PrefrencesService.isLogin();
    //print(res);
    if (res == true) {
      Navigator.pushReplacementNamed(context, 'HomepageScreen/');
    } else {
      Navigator.pushReplacementNamed(context, 'LoginScreen/');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PKColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            appLogoWidget(),
            10.heightBox,
            appname.text.fontFamily(bold).size(22).white.make(),
            5.heightBox,
            appversion.text.white.make(),
            //Spacer(),
            credits.text.white.make(),
            30.heightBox,
          ],
        ),
      ),
    );
  }
}
