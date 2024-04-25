import 'dart:convert';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;

import '../constants/cbcolors.dart';
import 'Forget_Screen.dart';
import 'RoundButton.dart';

class VerifyOtp extends StatefulWidget {
  String email;
  VerifyOtp({required this.email});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();
  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  bool showError = false;
  @override
  Widget build(BuildContext context) {
    const length = 6;
    const borderColor = Color.fromRGBO(114, 178, 238, 1);
    const errorColor = Color.fromRGBO(255, 234, 238, 1);
    const fillColor = Color.fromRGBO(222, 231, 240, .57);
    // final defaultPinTheme = PinTheme(
    //   width: 56,
    //   height: 60,
    //   textStyle: TextStyle(fontFamily: 'SourceSansPro'),
    //   decoration: BoxDecoration(
    //     color: fillColor,
    //     borderRadius: BorderRadius.circular(8),
    //     border: Border.all(color: Colors.transparent),
    //   ),
    // );
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: CBColors.lightblue,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Verify',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'SourceSansPro'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      'assets/icons/dashboard/password.png',
                      height: 120,
                      width: 120,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'We send a Verification code to',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      widget.email,
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20,),
                    // SizedBox(
                    //   child: Pinput(
                    //     length: length,
                    //     controller: controller,
                    //     focusNode: focusNode,
                    //     defaultPinTheme: defaultPinTheme,
                    //     onCompleted: (pin) {
                    //       setState(() => showError = pin != '5555');
                    //     },
                    //     focusedPinTheme: defaultPinTheme.copyWith(
                    //       decoration: defaultPinTheme.decoration!.copyWith(
                    //         border: Border.all(color: borderColor),
                    //       ),
                    //     ),
                    //     errorPinTheme: defaultPinTheme.copyWith(
                    //       decoration: BoxDecoration(
                    //         color: errorColor,
                    //         borderRadius: BorderRadius.circular(8),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 20,),
                    Text(
                      'The Verify Code will be Expire in 1 Hour',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
           Container(
             height: MediaQuery.of(context).size.height * 0.2,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Spacer(),
                 Text(
                   'For any technical assistance contact',
                   style: TextStyle(
                     fontFamily: 'SourceSansPro',
                     fontSize: 14,
                     color: CBColors.cellSeperatorColors
                   ),
                 ),
                 Text(
                   'cbcare@mlc.gov.pk',
                   style: TextStyle(
                     fontFamily: 'SourceSansPro',
                     fontSize: 14, color: CBColors.cellSeperatorColors
                   ),
                 ),
               ],
             ),
           ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: RoundButton(
                          title: 'Confirm',
                          onpress: (){

                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
  // Future<void> Verficationtoken(String otp) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse('https://app.mlc.gov.pk/api/edastarus/verify/email/token'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json',
  //       },
  //       body: jsonEncode(<String, String>{'sms_code': otp}),
  //     );
  //
  //     if (response.statusCode == 200) {
  //       final jsonResponse = json.decode(response.body);
  //       final status = jsonResponse['status'];
  //
  //       if (status['code'] == "200" && status['type'] == "success") {
  //         final message = status['messages']['message'];
  //         final user = status['messages']['eUser'];
  //
  //         // Extract user details
  //         final email = user['email'];
  //         final name = user['name'];
  //         final mobileNo = user['mobile_no'];
  //         final password = user['user_password'];
  //         final emailverified = user['email_verified'];
  //         final token = user['token'];
  //         final userCategory = user['user_category'];
  //         final officeid = user['office_id'];
  //
  //         // Display success message
  //         Fluttertoast.showToast(
  //           msg: message,
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.BOTTOM,
  //           timeInSecForIosWeb: 1,
  //           backgroundColor: Colors.green,
  //           textColor: Colors.white,
  //           fontSize: 16.0,
  //         );
  //
  //         print(email);
  //         print(name);
  //         print(mobileNo);
  //
  //         if(password==null && emailverified==1){
  //           Navigator.pushReplacement(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) => Forget(
  //               mobileNo
  //               ),
  //             ),
  //           );
  //         // }else{
  //         //   if(password!=null && emailverified==1){
  //         //     DataManager.getInstance()!.updateUser(
  //         //         User(
  //         //             mobileNumber: mobileNo,
  //         //             name: name,
  //         //             officeID: officeid,
  //         //             token: token,
  //         //             userCategory: userCategory));
  //             Navigator.pushReplacement(
  //               context, MaterialPageRoute(builder: (context) => Dashboard(),),);
  //           }
  //         }
  //
  //
  //       } else if (status['code'] == "601" && status['type'] == "error") {
  //         final errorMessage = status['messages']['message']; // Get the error message
  //         Fluttertoast.showToast(
  //           msg: errorMessage,
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.BOTTOM,
  //           timeInSecForIosWeb: 1,
  //           backgroundColor: Colors.red,
  //           textColor: Colors.white,
  //           fontSize: 16.0,
  //         );
  //       }  else {
  //         // Handle other status codes or types if necessary
  //         throw Exception("Invalid login response: $status");
  //       }
  //     } else {
  //       // Handle non-200 response codes
  //       throw Exception("Failed to login. Status code: ${response.statusCode}");
  //     }
  //   } on SocketException {
  //     throw Exception("No internet Connection");
    }


