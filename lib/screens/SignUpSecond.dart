import 'dart:convert';
import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;

import '../constants/cbcolors.dart';

import 'RoundButton.dart';

class SignUpSecond extends StatefulWidget {
  String email;
  String mobile;
  String cnic;
  SignUpSecond(this.email,this.mobile,this.cnic);

  @override
  State<SignUpSecond> createState() => _SignUpSecondState();
}

class _SignUpSecondState extends State<SignUpSecond> {
  bool _isLoading = false;
  ScrollController _scrollController = new ScrollController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  String name = '';
  String  address= '';
  String cnic = '';
  String password = '';
  String confirmpassword = '';
  // Occupation? dropDownValueoccupation;
  // Office? dropDownValue;
 // TextStyle placeHolderTextStyle = CBTheme.placeHolderTextStyle;
  // LocationData? currentLocation;
  String? _currentAddress;
  // Position? _currentPosition;

  String? registerdthrough;
  String? devicemodelname;
  String? deviceimeino;
  String? passwordError;
  String? nameError;
  String? addressError;
  String? confirmPasswordError;
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
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
  void _validatePasswords() {
    if (_passwordController.text != _confirmPasswordController.text) {
      setState(() {
        passwordError = "Passwords do not match";
      });
    } else {
      setState(() {
        passwordError = null;
      });
    }
  }
  /*void _validateFields() {
    setState(() {
      nameError = _nameController.text.isEmpty ? "Name is required" : null;
      addressError = _addressController.text.isEmpty ? "Address is required" : null;
      passwordError = _passwordController.text.isEmpty ? "Password is required" : null;
      confirmPasswordError = _confirmPasswordController.text.isEmpty ? "Confirm password is required" : null;
      if (_passwordController.text != _confirmPasswordController.text) {
        confirmPasswordError = "Passwords do not match";
      }
    });
    if (nameError == null && addressError == null && passwordError == null && confirmPasswordError == null) {
      setState(() {
        _isLoading = true; // Set isLoading to true when the process starts
      });

      // Call your CreateAccount function
      CreateAccount(
        name,
        widget.mobile,
        widget.cnic,
        widget.email,
        dropDownValue!.officeId,
        password,
        deviceimeino!,
        address,
        registerdthrough!,
        dropDownValueoccupation!.id,
        _currentAddress.toString(),
        _currentPosition!.latitude.toString(),
        _currentPosition!.longitude.toString(),
      ).then((_) {
        setState(() {
          _isLoading = false; // Set isLoading to false when the process completes
        });
      }).catchError((error) {
        setState(() {
          _isLoading = false; // Set isLoading to false if an error occurs
        });
        // Handle errors here if needed
      });
    }
  }*/
/*  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getoccupationList();
    if (DataManager.getInstance()!.offices.length <= 0 ||
        DataManager.getInstance()!.canFetchOfficesNow()) {
      Future.delayed(Duration(milliseconds: 500), () {
        getOfficeList();
      });
    } else {
      _updateDefaultCantonment();
    }
    deviceinfo();
    _getCurrentPosition();
  }*/
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            // Here the height of the container is 45% of our total height
            height: 150,
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
          ),
          SafeArea(
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 50,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35)),
                      color: CBColors.lightblue,
                    ),
                    child: Center(child: Text('Create Account to get started',style: TextStyle(fontFamily: 'SourceSansPro',fontSize: 23,),)),
                  ),
                ),

                Positioned(
                  top: 120,
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
                          SizedBox(height: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            verticalDirection: VerticalDirection.down,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(35, 8, 35, 0),
                                child: TextFormField(
                                  controller: _nameController,
                                  decoration: textinputDecoration.copyWith(
                                    labelText: "Enter Your Name", // Update the labelText to indicate entering a name
                                    prefixIcon: Icon(
                                      Icons.person, // Change the prefixIcon to a person icon for indicating a name input
                                      color: CBColors.cellSeperatorColors,
                                    ),
                                  ),
                                  onChanged: (val) {
                                    setState(() {
                                      name = val; // Update the name variable with the entered value
                                    });
                                  },
                                  validator: (val) {
                                    return val!.isEmpty ? "Name is required" : null; // Validate that the name is not empty
                                  },
                                  keyboardType: TextInputType.text, // Set keyboardType to accept text input for entering a name
                                ),
                              ),

                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(35, 8, 35, 0),
                                child: TextFormField(
                                  controller: _addressController,
                                  decoration: textinputDecoration.copyWith(
                                    labelText: "Enter Your Address", // Update the labelText to indicate entering an address
                                    prefixIcon: Icon(
                                      Icons.location_on, // Change the prefixIcon to a location icon for indicating an address input
                                      color: CBColors.cellSeperatorColors,
                                    ),
                                  ),
                                  onChanged: (val) {
                                    setState(() {
                                      address = val; // Update the address variable with the entered value
                                    });
                                  },
                                  validator: (val) {
                                    return val!.isEmpty ? "Address is required" : null; // Validate that the address is not empty
                                  },
                                  keyboardType: TextInputType.streetAddress, // Set keyboardType to accept street address input
                                ),
                              ),

                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(35, 8, 35, 0),
                                child: Stack(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                      child: Container(
                                        constraints: BoxConstraints.expand( height: 50),
                                        alignment: Alignment.centerRight,
                                        child: const Image(
                                          image: AssetImage("assets/icons/signup/arrow_down.png"),
                                        ),
                                      ),
                                    ),
                              //       Visibility(
                              //         child: DropdownButtonHideUnderline(
                              //           child: Container(
                              //             constraints: BoxConstraints.expand(width: MediaQuery.of(context).size.width, height: 55),
                              //             decoration: ShapeDecoration(
                              //               shape: RoundedRectangleBorder(
                              //                 side: BorderSide(
                              //                     width: 1.0,
                              //                     style: BorderStyle.solid,
                              //                   color: CBColors.cellSeperatorColors,),
                              //                 borderRadius: BorderRadius.all(Radius.circular(12.0)),
                              //               ),
                              //             ),
                              //             padding: EdgeInsets.all(0),
                              //       //       child: Padding(
                              //       //         child: InkWell(
                              //       //           onTap: () {
                              //       //             // showoccupationDropDown();
                              //       //           },
                              //       //   //         child: dropDownValueoccupation == null
                              //       //   //             ? Align(
                              //       //   //           child: AutoSizeText(
                              //       //   //             "Select Occupation",
                              //       //   //             minFontSize: 2,
                              //       //   //             maxLines: 1,
                              //       //   //             style: placeHolderTextStyle,
                              //       //   //             textAlign: TextAlign.center,
                              //       //   //           ),
                              //       //   //           alignment: Alignment.centerLeft,
                              //       //   //         ) : Align(
                              //       //   //           child: AutoSizeText(
                              //       //   //             dropDownValueoccupation!.name,
                              //       //   //             minFontSize: 2,
                              //       //   //             maxLines: 1,
                              //       //   //             style: Constants.textFieldsStyles,
                              //       //   //             textAlign: TextAlign.center,
                              //       //   //           ),
                              //       //   //           alignment: Alignment.centerLeft,
                              //       //   //         ),
                              //       //   //       ),
                              //       //   //       padding: EdgeInsets.only(
                              //       //   //         right: 12,
                              //       //   //         left: 16,
                              //       //   //         bottom: 0,
                              //       //   //         top: 0,
                              //       //   //       ),
                              //       //   //     ),
                              //       //   //   ),
                              //       //   // ),
                              //       //   // visible: true,
                              //       // ),
                              //       //       )],
                              //   ),
                              // ),
                              // const SizedBox(
                              //   height: 10,
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.fromLTRB(35, 8, 35, 0),
                              //   child: Stack(
                              //     children: <Widget>[
                              //       Padding(
                              //         padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              //         child: Container(
                              //           constraints: BoxConstraints.expand(height: 50),
                              //           alignment: Alignment.centerRight,
                              //           child: const Image(
                              //             image: AssetImage("assets/icons/signup/arrow_down.png"),
                              //           ),
                              //         ),
                              //       ),
                              //       Visibility(
                              //         child: DropdownButtonHideUnderline(
                              //           child: Container(
                              //             constraints: BoxConstraints.expand(width: MediaQuery.of(context).size.width, height: 55),
                              //             decoration: ShapeDecoration(
                              //               shape: RoundedRectangleBorder(
                              //                 side: BorderSide(
                              //                   width: 1.0,
                              //                   style: BorderStyle.solid,
                              //                   color: CBColors.cellSeperatorColors,),
                              //                 borderRadius: BorderRadius.all(Radius.circular(12.0)),
                              //               ),
                              //             ),
                              //             padding: EdgeInsets.all(0),
                              //             child: Padding(
                              //               child: InkWell(
                              //                 onTap: () {
                              //                   showDropDown();
                              //                 },
                              //                 child: dropDownValue == null
                              //                     ? Align(
                              //                   child: AutoSizeText(
                              //                     Localization.cbLocalized('selectContanoment')!,
                              //                     minFontSize: 2,
                              //                     maxLines: 1,
                              //                     style: placeHolderTextStyle,
                              //                     textAlign: TextAlign.center,
                              //                   ),
                              //                   alignment: Alignment.centerLeft,
                              //                 )
                              //                     : Align(
                              //                   child: AutoSizeText(
                              //                     dropDownValue!.name,
                              //                     minFontSize: 2,
                              //                     maxLines: 1,
                              //                     style: Constants.textFieldsStyles,
                              //                     textAlign: TextAlign.center,
                              //                   ),
                              //                   alignment: Alignment.centerLeft,
                              //                 ),
                              //               ),
                              //               padding: EdgeInsets.only(
                              //                 right: 12,
                              //                 left: 16,
                              //                 bottom: 0,
                              //                 top: 0,
                              //               ),
                              //             ),
                              //           ),
                              //         ),
                              //         visible: true,
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              // SizedBox(height: 10),
                              // Padding(
                              //   padding: const EdgeInsets.fromLTRB(35, 8, 35, 0),
                              //   child: TextFormField(
                              //     controller: _passwordController,
                              //     decoration: textinputDecoration.copyWith(
                              //       labelText: "Enter Your Password", // Update the labelText to indicate entering a password
                              //       prefixIcon: Icon(
                              //         Icons.lock, // Change the prefixIcon to a lock icon for indicating a password input
                              //         color: CBColors.cellSeperatorColors,
                              //       ),
                              //     ),
                              //     onChanged: (val) {
                              //       setState(() {
                              //         password = val; // Update the password variable with the entered value
                              //       });
                              //       _validatePasswords();
                              //     },
                              //     validator: (val) {
                              //       return val!.isEmpty ? "Password is required" : null; // Validate that the password is not empty
                              //     },
                              //     keyboardType: TextInputType.text, // Set keyboardType to accept text input for entering a password
                              //     obscureText: true, // Hide the entered text as dots to indicate it's a password
                              //   ),
                              // ),
                              //
                              // SizedBox(height: 10),
                              // Padding(
                              //   padding: const EdgeInsets.fromLTRB(35, 8, 35, 0),
                              //   child: TextFormField(
                              //     controller: _confirmPasswordController,
                              //     decoration: textinputDecoration.copyWith(
                              //       labelText: "Confirm Your Password", // Update the labelText to indicate entering a password
                              //       prefixIcon: Icon(
                              //         Icons.lock, // Change the prefixIcon to a lock icon for indicating a password input
                              //         color: CBColors.cellSeperatorColors,
                              //       ),
                              //     ),
                              //     onChanged: (val) {
                              //       setState(() {
                              //         confirmpassword = val; // Update the password variable with the entered value
                              //       });
                              //       _validatePasswords();
                              //     },
                              //     validator: (val) {
                              //       if (val!.isEmpty) {
                              //         return "Confirm password is required";
                              //       } else if (val != _passwordController.text) {
                              //         return "Passwords do not match";
                              //       }
                              //       return null;
                              //     },
                              //     keyboardType: TextInputType.text, // Set keyboardType to accept text input for entering a password
                              //     obscureText: true, // Hide the entered text as dots to indicate it's a password
                              //   ),
                              // ),
                              // SizedBox(height: 10),
                              //
                              // if (passwordError != null)
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: Text(
                                    passwordError!,
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: _isLoading
                                    ? CircularProgressIndicator() // Show progress indicator if _isLoading is true
                                    : RoundButton(
                                  title: 'Continue',
                                  onpress: (){},
                                ),
                              )
                            ],
                          ),
                              )],
                      ),
                    ]),
                  ),
                ),
    )],
            ),
          ),


        ],

      ),
    );
  }
/*  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Location services are disabled. Please enable the services')));
      openAppSettings();
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    if (permission == LocationPermission.unableToDetermine) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Location permissions are not enable Please Enable Your Location Permission.')));
      openAppSettings();
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition()
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
      print('currentadresslat');
      print(_currentPosition?.latitude);
      print(_currentPosition?.longitude);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
        _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress = '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
        print('adress');
        print(_currentAddress);

      });
    }).catchError((e) {
      debugPrint(e);
    });
  }
  Future<void> deviceinfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo info = await deviceInfo.androidInfo;
      deviceimeino =await UniqueIdentifier.serial;
      registerdthrough='Android';
      print("info.device");
      print(deviceimeino);
    } else if (Platform.isIOS) {
      IosDeviceInfo info = await deviceInfo.iosInfo;
      print("info.device");
      print(info.identifierForVendor);
      print(info.systemName);
      devicemodelname=info.name;
      deviceimeino=info.identifierForVendor;
      registerdthrough=info.systemName;
    }
  }
  void getoccupationList() {
    //showProgressHUD(true);
    ServerManger.getOfficeList((String? responseBody, bool success) {
      //showProgressHUD(false);
      if (success) {
        bool successCode = ServerManger.isSuccessCode(responseBody!);
        if (successCode) {
          DataManager.getInstance()!.updateOccupation(responseBody);
          _updateDefaultOccupation();


        }
      } else {
        if (responseBody != null) {}
        AppUtil.showSimpleAlertDialog(
            context,
            Localization.cbLocalized("Error")!,
            Localization.cbLocalized('interneterror')!);
      }

      ///remove return null
      return (){
      } ;
    });
  }
  void getOfficeList() {
    //showProgressHUD(true);
    ServerManger.getOfficeList((String? responseBody, bool success) {
      //showProgressHUD(false);
      if (success) {
        bool successCode = ServerManger.isSuccessCode(responseBody!);
        if (successCode) {
          DataManager.getInstance()!.updateOffice(responseBody);
          _updateDefaultCantonment();
          print(responseBody);
        }
      } else {
        if (responseBody != null) {}
        AppUtil.showSimpleAlertDialog(
            context,
            Localization.cbLocalized("Error")!,
            Localization.cbLocalized('interneterror')!);
      }

      ///remove return null
      return (){
      } ;
    });
  }
  void _updateDefaultCantonment() {
    if (DataManager.getInstance()!.offices.length > 0 && dropDownValue == null) {
      Office office = DataManager.getInstance()!.offices[0];
      setState(() {
        dropDownValue = office;
      });
    }
  }
  void _updateDefaultOccupation() {
    if (DataManager.getInstance()!.occupation.length > 0 && dropDownValueoccupation == null) {
      Occupation occupation = DataManager.getInstance()!.occupation[0];
      setState(() {
        dropDownValueoccupation = occupation;
      });
    }
  }
  void showoccupationDropDown() {
    Navigator.of(context).push(new CupertinoPageRoute(fullscreenDialog: true, builder: (context) {
      return SearchList(
        placeHolder: "Select Occupation",
        dropDownType: SearchDropDownType.Occupation,
        items:DataManager.getInstance()?.occupation,
      );
    })).then((selectedObj) {
      if (selectedObj != null) {
        setState(() {
          dropDownValueoccupation = selectedObj;
          print("occupation");
          print(dropDownValueoccupation!.name);
          Fluttertoast.showToast(msg: dropDownValueoccupation!.name);
        });
      }else{
        // Fluttertoast.showToast(msg: "not load");
      }
    });
  }
  void showDropDown() {
    Navigator.of(context).push(new CupertinoPageRoute(fullscreenDialog: true, builder: (context) {
      return SearchList(
        placeHolder: Localization.cbLocalized('selectContanoment'),
        dropDownType: SearchDropDownType.Offices,
        items:DataManager.getInstance()?.offices,
      );
    })).then((selectedObj) {
      if (selectedObj != null) {
        setState(() {
          dropDownValue = selectedObj;
          Fluttertoast.showToast(msg: dropDownValue!.name);
        });
      }else{
        // Fluttertoast.showToast(msg: "not load");
      }
    });
  }*/

/*  Future<void> CreateAccount(String name,String mobile, String cnic, String email, String officeid, String password,
      String imeino, String permntaddress, String registerthrough,
      String occupation, String regadress, String reglat, String reglng) async {
    print(name);
    print(mobile);
    print(cnic);
    print(email);
    print(officeid);
    print(password);
    print(imeino);
    print(permntaddress);
    print(registerthrough);
    print(occupation);
    print(regadress);
    print(reglat);
    print(reglng);
    try {
      final response = await http.post(
        Uri.parse('https://app.mlc.gov.pk/api/edastarus/signup/email'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'name': name,
          'mobile_no': mobile,
          'cnic': cnic,
          'email': email,
          'office_id': officeid,
          'password': password,
          'imei_no': imeino,
          'permanent_address': permntaddress,
          'registered_through': registerthrough,
          'occupation': occupation,
          'registration_address': regadress,
          'registration_latitude': reglat,
          'registration_longitude': reglng
        }),
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final status = jsonResponse['status'];
        print(response.body);
        if (status['code'] == "200" && status['type'] == "success") {
          final user = status['messages']['user'];
          final message = status['messages']['registered'];

          // Extract user details
          final useremail = user['email'];
          final username = user['name'];
          final usermobileNo = user['mobile_no'];
          final userpassword = user['user_password'];
          final emailverified = user['email_verified'];
          final token = user['token'];
          final userCategory = user['user_category'];
          final userOfficeId = user['office_id'];

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

          // Navigate to the next screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => VerfiyEmail(
                useremail, usermobileNo,
              ),
            ),
          );
        } else if (status['code'] == "601" && status['type'] == "error") {
          final errorMessage = status['messages']['user'];
          print(errorMessage);
          // Display error message if needed
          *//*Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );*//*
        } else {
          // Handle other status codes or types if necessary
          throw Exception("Invalid response: $status");
        }
      } else {
        // Handle non-200 response codes
        throw Exception("Failed to create account. Status code: ${response.statusCode}");
      }
    } on SocketException {
      throw Exception("No internet Connection");
    }
  }*/

}
