import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../resource/images_manager.dart';
import '../../../../resource/routes_manager.dart';

class RowInTableOfCompleteDataScreen extends StatelessWidget {
  RowInTableOfCompleteDataScreen(
      {Key? key, required this.text1, required this.text2 , required this.onTap})
      : super(key: key);

  String text1;

  String text2;

  Function onTap ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      padding: EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Row(
        children: [
          Text(
            text1,
            style: TextStyle(
              fontFamily: 'hanimation',
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          Text(
            text2,
            style: TextStyle(
              fontFamily: 'hanimation',
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () {

              onTap()  ;
            },
            child: SvgPicture.asset(
              ImageAssets.editImage,
              height: 70,
              width: 70,
            ),
          ),
        ],
      ),
    );
  }
}
