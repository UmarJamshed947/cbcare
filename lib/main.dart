import 'dart:io';


import 'package:cbcare/screens/Login_Screen.dart';

import 'package:flutter/material.dart';



import 'constants/cbcolors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Upgrader.clearSavedSettings();
  runApp(const Cbcare());
}

class Cbcare extends StatelessWidget {
  const Cbcare({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
          backgroundColor: CBColors.lightGreenBackground,
          body: Login_Screen(),
          //body: SignUpSecond('afrashafqat@gmail.com','03110867518','1330291042935'),
          // body: VerfiyEmail('','031108675'),
          resizeToAvoidBottomInset: false,
        ),
        /*  home: UpgradeAlert(
          upgrader: Upgrader(
            canDismissDialog: false,
            showIgnore: false,
            showLater: false,
          ),
          child: Scaffold(
            backgroundColor: CBColors.lightGreenBackground,
            body: SplashScreen(),
            resizeToAvoidBottomInset: false,
          ),
        ),*/
        debugShowCheckedModeBanner: false
    );


  }
}





/*794119*/

/*
* playstore versio 1.17.4
* appstore 0.10.0*/