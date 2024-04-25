
import 'package:flutter/material.dart';

import '../constants/cbcolors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool? loading;
  final VoidCallback onpress;
  const RoundButton({Key? key, required this.title, this.loading = false, required this.onpress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        height: 50,
        width: 260,
        decoration: BoxDecoration(
            color: CBColors.Buttoncolor,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child: loading == true? CircularProgressIndicator(color: Colors.white,) : Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),
      ),
    );
  }
}
