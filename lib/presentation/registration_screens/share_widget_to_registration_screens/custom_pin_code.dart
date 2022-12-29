import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../resource/colors_manager.dart';

class CustomPinCode extends StatelessWidget {

  final Function onCompleted ;
  CustomPinCode({Key? key , required this.onCompleted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: 6,
      autoFocus: true,
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
      appContext: context,
      obscureText: false,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.underline,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          activeFillColor: ColorManager.myWhite,
          borderWidth: 1,
          activeColor: ColorManager.yellowColor,
          inactiveColor: ColorManager.yellowColor,
          inactiveFillColor: Colors.white,
          selectedColor: ColorManager.yellowColor,
          selectedFillColor: ColorManager.myWhite),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      enableActiveFill: true,
      onCompleted: (code) {
        onCompleted(code) ;
      },
      onChanged: (value) {
        print(value);
      },
    );
  }
}
