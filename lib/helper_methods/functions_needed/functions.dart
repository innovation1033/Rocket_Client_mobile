import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({required String message,required ToastStates state}){
  Fluttertoast.showToast(
      msg:message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor:chosseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0
  );

}
enum ToastStates {SUCCES,ERORR,WARNING}

Color chosseToastColor(ToastStates state)
{
  Color color;
  switch(state)
  {
    case ToastStates.SUCCES:
      color=Colors.green;
      break;
    case ToastStates.ERORR:
      color=Colors.red;
      break;
    case ToastStates.WARNING:
      color=Colors.amber;
      break;
  }
  return color;


}

validateMobile(String value) {

  String pattern = r'^01[0125][0-9]{8}$';
  RegExp regExp = new RegExp(pattern);
  if (value.length == 0) {
    return 'برجاء أدخال رقم الموبايل';
  }
  else if (!regExp.hasMatch(value)) {
    return 'برجاء أدخال رقم موبايل صحيح';
  }

  return null;
}
void navigateAndFinshScreen(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
        (route) => false);
navigateAndFinish(context, {required Widget layout}) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => layout));
}

void navigateAndRemove(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
        (route) => false);

navigateAndBack(context, {required Widget layout}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => layout));
}
