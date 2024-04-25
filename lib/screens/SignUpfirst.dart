import 'dart:convert';
import 'dart:io';



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;

import '../constants/cbcolors.dart';
import 'RoundButton.dart';
import 'SignUpSecond.dart';

class Signupfirst extends StatefulWidget {
  const Signupfirst({Key? key}) : super(key: key);

  @override
  State<Signupfirst> createState() => _SignupfirstState();
}

class _SignupfirstState extends State<Signupfirst> {
  ScrollController _scrollController = new ScrollController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cnicController = TextEditingController();
  String mobile = '';
  String email = '';
  String cnic = '';

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
    super.initState();
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
                    child: Center(child: Text('Create Account to get started',
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
                                  controller: _mobileController,
                                  decoration: textinputDecoration.copyWith(
                                    labelText: "Enter Your Mobile Number",
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
                                  controller: _emailController,
                                  obscureText: false,
                                  // Not obscuring text for email input
                                  decoration: textinputDecoration.copyWith(
                                    labelText: "Enter Your Email",
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: CBColors.cellSeperatorColors,
                                    ),
                                  ),
                                  validator: (val) {
                                    // Validate email format
                                    if (val!.isEmpty) {
                                      return "Email is required";
                                    } else if (!RegExp(
                                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                        .hasMatch(val)) {
                                      return "Please enter a valid email address";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (val) {
                                    setState(() {
                                      email = val;
                                    });
                                  },
                                  keyboardType: TextInputType
                                      .emailAddress, // Set keyboardType to accept email input
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    20, 8, 20, 0),
                                child: TextFormField(
                                  controller: _cnicController,
                                  obscureText: false,
                                  // Not obscuring text for CNIC input
                                  decoration: textinputDecoration.copyWith(
                                    labelText: "Enter Your CNIC",
                                    prefixIcon: Icon(
                                      Icons.credit_card,
                                      color: CBColors.cellSeperatorColors,
                                    ),
                                  ),
                                  validator: (val) {
                                    // Validate CNIC format
                                    if (val!.isEmpty) {
                                      return "CNIC is required";
                                    } else if (val.length != 13 ||
                                        int.tryParse(val) == null) {
                                      return "Please enter a valid 13-digit CNIC number";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (val) {
                                    setState(() {
                                      cnic = val;
                                    });
                                  },
                                  keyboardType: TextInputType.number,
                                  // Set keyboardType to accept number input
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(13)
                                  ], // Limit input length to 13 characters
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: RoundButton(
                                  title: 'Next', /*loading: authViewModel.loading,*/
                                  onpress: () {
                                    if (mobile.isEmpty || mobile.length != 11) {
                                      Fluttertoast.showToast(
                                        msg: "Please enter a valid mobile number (11 digits)",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      return;
                                    }

                                    // Validate email
                                    if (email.isEmpty || !RegExp(
                                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                        .hasMatch(email)) {
                                      Fluttertoast.showToast(
                                        msg: "Please enter a valid email address",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      return;
                                    }

                                    // Validate CNIC
                                    if (cnic.isEmpty || cnic.length != 13 ||
                                        int.tryParse(cnic) == null) {
                                      Fluttertoast.showToast(
                                        msg: "Please enter a valid 13-digit CNIC number",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      return;
                                    }
                                    Signupfirst(mobile, cnic, email);
                                  },
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

  Future<void> Signupfirst(String mobile, String cnic, String email) async {
    try {
      final response = await http.post(
        Uri.parse('https://app.mlc.gov.pk/api/edastarus/check/mobile/no'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'mobile_no': mobile,
          'cnic': cnic,
          'email': email
        }),
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final status = jsonResponse['status'];

        if (status['code'] == "200" && status['type'] == "success") {
          final message = status['messages']['account'];
          final user = status['messages']['user'];

          // Extract user details
          final useremail = user['email'];
          final username = user['name'];
          final usermobileNo = user['mobile_no'];
          final password = user['user_password'];
          final emailverified = user['email_verified'];
          final token = user['token'];
          final userCategory = user['user_category'];
          final officeid = user['office_id'];

          // Display success message
          Fluttertoast.showToast(
            msg: message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
          );

          print(useremail);
          print(username);
          print(usermobileNo);
        } else if (status['code'] == "601" && status['type'] == "error") {
          final errorMessage = status['messages'][0]; // Get the error message
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  SignUpSecond(
                      email, mobile, cnic
                  ),
            ),
          );
          /* // Check if 'Account' error message exists
          if (status['messages'].containsKey('mobile_no')) {
            final accountErrorMessage = status['messages']['mobile_no'];
            // Handle the 'Account' error message
            print('Account Error: $accountErrorMessage');
          }
// Check if 'error' error message exists
          else if (status['messages'].containsKey('error')) {
            final errorErrorMessage = status['messages']['error'];
            // Handle the 'error' error message
            print('Error: $errorErrorMessage');
          }
// Check if 'Email' error message exists
          else if (status['messages'].containsKey('cnic')) {
            final emailErrorMessage = status['messages']['cnic'];
            // Handle the 'Email' error message
            print('cnic Error: $emailErrorMessage');
          }
// Handle other cases where error message keys are different
          else {
            print('Unknown Error: ${status['messages']}');
          }*/
          Fluttertoast.showToast(
            msg: errorMessage,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        } else {
          // Handle other status codes or types if necessary
          throw Exception("Invalid login response: $status");
        }
      } else {
        // Handle non-200 response codes
        throw Exception("Failed to login. Status code: ${response.statusCode}");
      }
    } on SocketException {
      throw Exception("No internet Connection");
    }
  }
}