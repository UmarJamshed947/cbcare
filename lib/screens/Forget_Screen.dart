import 'dart:convert';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../constants/cbcolors.dart';

import 'RoundButton.dart';

class Forget extends StatefulWidget {
  String mobile;
  Forget(this.mobile);

  @override
  State<Forget> createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
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
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  String mobileno = '';
  String password = '';
  String confirmPassword = '';
  bool _obscurePassword = true;
  bool _confirmobscurePassword = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
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
            child: Image.asset(
              'assets/icons/signup/logo_cb_care_signup.png',
              width: double.infinity,
            ),
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
                    child: Center(
                      child: Text(
                        'Set Your Password',
                        style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 23,
                        ),
                      ),
                    ),
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
                          topRight: Radius.circular(25),
                        ),
                        color: Colors.white,
                      ),
                      child: ListView(
                        shrinkWrap: false,
                        scrollDirection: Axis.vertical,
                        children: [
                          SizedBox(height: 30),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                                child: TextFormField(
                                  controller: passwordController,
                                  obscureText: _obscurePassword, // Use a variable to toggle obscureText
                                  decoration: textinputDecoration.copyWith(
                                    labelText: "Enter Your Password",
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: CBColors.cellSeperatorColors,
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _obscurePassword = !_obscurePassword; // Toggle obscureText on button press
                                        });
                                      },
                                      icon: Icon(
                                        _obscurePassword ? Icons.visibility : Icons.visibility_off,
                                        color: CBColors.cellSeperatorColors,
                                      ),
                                    ),
                                  ),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Password is required";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (val) {
                                    setState(() {
                                      password = val;
                                    });
                                  },
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                                child: TextFormField(
                                  controller: confirmPasswordController,
                                  obscureText: _confirmobscurePassword, // Use the same variable for confirmation password
                                  decoration: textinputDecoration.copyWith(
                                    labelText: "Confirm Password",
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: CBColors.cellSeperatorColors,
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _confirmobscurePassword = !_confirmobscurePassword; // Toggle obscureText on button press
                                        });
                                      },
                                      icon: Icon(
                                        _confirmobscurePassword ? Icons.visibility : Icons.visibility_off,
                                        color: CBColors.cellSeperatorColors,
                                      ),
                                    ),
                                  ),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Confirm Password is required";
                                    } else if (val != passwordController.text) {
                                      return "Passwords do not match";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (val) {
                                    setState(() {
                                      confirmPassword = val;
                                    });
                                  },
                                  keyboardType: TextInputType.text,
                                ),
                              ),

                              const SizedBox(height: 30),
                              Container(
                                alignment: Alignment.center,
                                child: RoundButton(
                                  title: 'Submit',
                                  onpress: () {
                                    // Validate passwords match
                                   /* if (passwordController.text !=
                                        confirmPasswordController.text) {
                                      Fluttertoast.showToast(
                                        msg: "Passwords do not match",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      return;*/
                                    }
                                    // print(widget.mobile);
                                    // print(password);
                                    // ForgetScreen(widget.mobile,password);

                                ),
                              ),
                              const SizedBox(height: 10),
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


 /* Future<void> ForgetScreen(String mobile, String userpassword) async {
    try {
      final response = await http.post(
        Uri.parse('https://app.mlc.gov.pk/api/edastarus/update/user/password'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{'mobile_no': mobile, 'user_password': password}),
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final status = jsonResponse['status'];

        if (status['code'] == "200" && status['type'] == "success") {
          final message = status['messages']['message'];
          final user = status['messages']['user'];

          // Extract user details
          final email = user['email'];
          final name = user['name'];
          final mobileNo = user['mobile_no'];
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

          print(email);
          print(name);
          print(mobileNo);

          if (password != null && emailverified == "1") {
            DataManager.getInstance()!.updateUser(
              User(
                mobileNumber: mobileNo,
                name: name,
                officeID: officeid,
                token: token,
                userCategory: userCategory,
              ),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Dashboard(),
              ),
            );
          }
        } else if (status['code'] == "601" && status['type'] == "error") {
          final errorMessage = status['messages']['message']; // Get the error message
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
  }*/

}
