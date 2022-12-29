import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget defaultButton(
    context,
    {required String text,
      required Function()? onPressed,
      required double widthButton,
      required double borderRadius,
      required Color colorButton,
      required double fontSize,
      required double heightButton,
      bool isLoading=false

    }) =>
    Container(
      //margin: EdgeInsets.only(bottom: 10),
      height: heightButton,
      width:widthButton,
      decoration: BoxDecoration(
        color: colorButton,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: MaterialButton(
        onPressed:isLoading?null:onPressed,
        child: isLoading?Center(child: CircularProgressIndicator(strokeWidth: .3.h,color: Colors.white,)):Text(
          "$text",
          style: TextStyle(color: Colors.white,fontSize: fontSize),
        ),
      ),
    );