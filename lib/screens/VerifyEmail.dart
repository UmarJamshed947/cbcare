import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/cbcolors.dart';
import 'RoundButton.dart';
class VerfiyEmail extends StatefulWidget {
  String email;
  String mobile;
  VerfiyEmail(this.email,this.mobile);

  @override
  State<VerfiyEmail> createState() => _VerfiyEmailState();
}

class _VerfiyEmailState extends State<VerfiyEmail> {
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  ScrollController _scrollController = new ScrollController();
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
  String mobileno = '';
  String useremail = '';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
            child: Image.asset('assets/icons/signup/logo_cb_care_signup.png',width: double.infinity,),
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
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35)),
                      color: CBColors.lightblue,
                    ),
                    child: Center(child: Text('Verify Your Email',style: TextStyle(fontFamily: 'SourceSansPro',fontSize: 23,),)),
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
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
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
                                padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                                child: TextFormField(
                                  controller: emailController,
                                  decoration: textinputDecoration.copyWith(
                                    //labelText: "Enter Your Email",
                                    // labelText: widget.email.isNotEmpty ? widget.email : "Enter Your Email",
                                    labelText: widget.email != null && widget.email.isNotEmpty ? widget.email : "Enter Your Email",
                                    labelStyle: TextStyle(
                                      color: Colors.black, // Set your desired label text color here
                                    ),
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: CBColors.cellSeperatorColors,
                                    ),

                                  ),
                                  //  initialValue: widget.email != null && widget.email.isNotEmpty ? widget.email : null,
                                  validator: (val) {
                                    // Validate the email format if it's not empty
                                    if (val!.isNotEmpty && !RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b').hasMatch(val)) {
                                      return "Please enter a valid email address";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (val) {
                                    setState(() {
                                      useremail = val; // Update the email variable
                                    });
                                  },
                                ),
                              ),

                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                                child: TextFormField(
                                  controller: mobileController,
                                  decoration: textinputDecoration.copyWith(
                                    labelText: widget.mobile.isNotEmpty ? widget.mobile : "Enter Your Mobile",
                                    labelStyle: TextStyle(
                                      color: Colors.black, // Set your desired label text color here
                                    ),
                                    prefixIcon: Icon(
                                      Icons.phone_android_outlined,
                                      color: CBColors.cellSeperatorColors,
                                    ),
                                  ),
                                  onChanged: (val) {
                                    setState(() {
                                      mobileno = val;
                                    });
                                  },
                                  validator: (val) {
                                    return val!.isEmpty || val.length != 11
                                        ? "Please enter a valid mobile number (11 digits)"
                                        : null;
                                  },
                                  keyboardType: TextInputType.phone, // Set keyboardType to accept phone number input
                                ),
                              ),

                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: RoundButton(title: 'Submit', /*loading: authViewModel.loading,*/
                                  onpress: (){

                                  },


                                ),
                              ),
                              const SizedBox(
                                height: 10,
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
 /* Future<dynamic> emailVerificationApi(String mobile, String email) async {
    try {
      final response = await http.post(
        Uri.parse('https://app.mlc.gov.pk/api/edastarus/verify/user/email'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{'mobile_no': mobile, 'email': email}),
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final status = jsonResponse['status'];

        if (status['code'] == "200" && status['type'] == "success") {
          final message = status['messages']['message'];

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

          //final user = status['messages']['user'];

          // Navigate to the next screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => VerifyOtp(
                 email: email,
              ),
            ),
          );
        } else if (status['code'] == "601" && status['type'] == "error") {
          final errorMessage = status['messages']['mobile_no'][0]; // Get the error message
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
          throw FetchException("Invalid login response: $status");
        }
      } else {
        // Handle non-200 response codes
        throw FetchException("Failed to login. Status code: ${response.statusCode}");
      }
    } on SocketException {
      throw FetchException("No internet Connection");
    }
  }*/

}


