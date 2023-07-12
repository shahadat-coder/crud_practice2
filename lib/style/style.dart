import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const colorRed = Color.fromRGBO(231, 28, 36, 1);
const colorGreen = Color.fromRGBO(33, 191, 115, 1);
const colorWhite = Color.fromRGBO(255, 255,255, 1);
const colorDarkBlue= Color.fromRGBO(44, 62,80, 1);


 SliverGridDelegateWithFixedCrossAxisCount ProductGridViewStyle() {
   return SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
     mainAxisSpacing: 2,
     mainAxisExtent: 250,

   );
 }


InputDecoration AppInputDecoration(label){
  return InputDecoration(
    border: OutlineInputBorder(),
    labelText: label,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    fillColor: Colors.grey.shade200,
    filled: true,
    contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20) ,
    enabledBorder: OutlineInputBorder(
  borderSide: BorderSide(color: Colors.white),

    ),

  );
}
DecoratedBox AppDropDrownStyle(child){
return DecoratedBox(
    decoration: BoxDecoration(
      color: Colors.grey.shade200,border: Border.all(color: colorWhite,width: 1),
      borderRadius: BorderRadius.circular(4),


    ),
  child: Padding(
    padding: EdgeInsets.only(right: 30,left: 30),
    child: child,
  ),
);
}




void ErrorToast( msg){

  Fluttertoast.showToast(
      msg:  msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );

}

void SuccessToast(msg){

  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: colorGreen,
      textColor: Colors.black,
      fontSize: 16.0
  );

}