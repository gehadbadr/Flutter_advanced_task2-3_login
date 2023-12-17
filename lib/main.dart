
import 'package:advanced_login/consts/consts.dart';
import 'package:advanced_login/providers/modelHud.dart';
import 'package:advanced_login/screens/homepage.screens.dart';
import 'package:advanced_login/screens/login_screen.dart';
import 'package:advanced_login/screens/signup_screen.dart';
import 'package:advanced_login/screens/splash.screens.dart';
import 'package:advanced_login/services/prefrences.services.dart';
import 'package:advanced_login/widgets/applogo.dart';
import 'package:advanced_login/widgets/custom_button.dart';
import 'package:advanced_login/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    PrefrencesService.prefs = await SharedPreferences.getInstance();
  } catch (e) {
    print(e.toString());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
        providers: [
          ChangeNotifierProvider<ModelHud>(
            create: (context) => ModelHud(),
          ),
        
        ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          /*    theme: ThemeData(
      //  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),*/
          initialRoute: '/',
          routes: {
            '/': (context) => SplashScreen(),
            'LoginScreen/': (context) => LoginScreen(),
            'SignupScreen/': (context) => SignupScreen(),
            'HomepageScreen/': (context) => HomepageScreen(),
          }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double height = context.screenHeight;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
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
              10.heightBox,
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
                    onPress: () {/* Get.to(()=> SignupScreen());*/},
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
