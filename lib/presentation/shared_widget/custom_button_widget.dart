
import 'package:flutter/material.dart';

import '../../resource/colors_manager.dart';

class CustomButton extends StatelessWidget {
  final double  width  ;
  final Function function ;
  final String text ;
  final double  borderRadius  ;
  Color ? color = ColorManager.primaryColor ;
  CustomButton({Key? key, required this.function, required this.text ,this.color ,  this.width= double.infinity  ,  this.borderRadius = 8 }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color:color,
          borderRadius: BorderRadius.circular(borderRadius) ,
        ),
        child: MaterialButton(
          onPressed: () {
            function();
          },
          child: Text(
            text,
            style: TextStyle(
              color: ColorManager.myWhite,
              fontSize: 20 ,
              fontWeight: FontWeight.bold  ,


            ),
          ),
        ),
      ),
    );

  }
}
