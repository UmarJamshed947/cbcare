

import 'dart:convert';


import 'package:cbcare/constants/cbcolors.dart';

import 'package:cbcare/screens/RoundButton.dart';
import 'package:cbcare/screens/SignUpfirst.dart';
import 'package:cbcare/screens/VerifyEmail.dart';
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 // TextStyle placeHolderTextStyle = CBTheme.placeHolderTextStyle;
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  ScrollController _scrollController = new ScrollController();
  String? mobileError;

  String mobile = '';
  String password = '';
  TextField? emailTextField;
 // EdgeInsets textFieldPadding = CBTheme.textFieldPadding;

  InputDecoration textinputDecoration = InputDecoration(
    labelStyle: TextStyle(
      color: CBColors.cellSeperatorColors,
      fontWeight: FontWeight.w300,
      fontFamily: 'SourceSansPro',
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(
        color: CBColors.cellSeperatorColors,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(
        color: CBColors.cellSeperatorColors,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(
        color: Colors.red,
      ),
    ),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // placeHolderTextStyle = CBTheme.placeHolderTextStyle;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            // Here the height of the container is 45% of our total height
            height: 300,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  CBColors.lightGreenBackground,
                  CBColors.lightGreenBackground,
                ],
              ),
            ),
            child: Image.asset('assets/icons/signup/logo_cb_care_signup.png',
              width: double.infinity,),
          ),

          SafeArea(

            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 220,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35)),
                      color: CBColors.lightblue,
                    ),
                    child: Center(child: Text('Login to Your Account',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro', fontSize: 23,),)),
                  ),
                ),

                Positioned(
                  top: 280,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Container(
                      height: size.height * .33,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                        //color: CBColors.white,
                        color: Colors.white,
                      ),
                      child: ListView(
                        controller: _scrollController,
                        shrinkWrap: false,
                        scrollDirection: Axis.vertical,
                        children: [
                          SizedBox(height: 30,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            verticalDirection: VerticalDirection.down,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    20, 8, 20, 0),
                                child: TextFormField(
                                  controller: mobileController,
                                  decoration: textinputDecoration.copyWith(
                                    labelText: " Enter Your Mobile Number",
                                    prefixIcon: Icon(
                                      Icons.phone_android_outlined,
                                      color: CBColors.cellSeperatorColors,
                                    ),
                                  ),
                                  onChanged: (val) {
                                    setState(() {
                                      mobile = val;
                                    });
                                  },
                                  validator: (val) {
                                    return val!.isEmpty || val.length != 11
                                        ? "Please enter a valid mobile number (11 digits)"
                                        : null;
                                  },
                                  keyboardType: TextInputType
                                      .phone, // Set keyboardType to accept phone number input
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    20, 8, 20, 0),
                                child: TextFormField(
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: textinputDecoration.copyWith(
                                    labelText: "Password",
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: CBColors.cellSeperatorColors,
                                    ),
                                  ),
                                  validator: (val) {
                                    // Password should be at least 6 characters long
                                    if (val!.length < 6) {
                                      return "Password must be at least 6 characters long";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (val) {
                                    setState(() {
                                      password = val;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: RoundButton(
                                  title: 'Sign in', /*loading: authViewModel.loading,*/
                                  onpress: () {

                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text.rich(
                                TextSpan(
                                  text: "Don't have an account? ",
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      color: Colors.black
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "Sign up",
                                      style: const TextStyle(
                                        color: Colors.blue,
                                        fontFamily: 'SourceSansPro',
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Signupfirst()),);
                                        },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) =>
                                          VerfiyEmail('', '')),);
                                },
                                child: Text(
                                  "Forget Password?",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontFamily: 'SourceSansPro',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),


        ],

      ),
    );
  }

}
