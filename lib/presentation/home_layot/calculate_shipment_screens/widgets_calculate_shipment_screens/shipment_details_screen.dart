import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../resource/colors_manager.dart';
import '../../../../resource/images_manager.dart';

class ShipmentDetailsScreen extends StatelessWidget {
  String image;

  String text1;
  String text2;

  Function onTap;

  ShipmentDetailsScreen(
      {Key? key, required this.text2, required this.image, required this.onTap , required this.text1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 7.h,
          width: 7.h,
          color: ColorManager.yellowColor,
          child: SvgPicture.asset(image,
              width: 5.h, height: 5.h, color: Colors.white),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(text1),
        Text(text2),
        const Spacer(),
        InkWell(
          onTap: () {
            onTap();
          },
          child: Container(
            height: 7.h,
            width: 7.h,
            color: Colors.transparent,
            child: SvgPicture.asset(ImageAssets.editImage,
                width: 5.h, height: 5.h, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
