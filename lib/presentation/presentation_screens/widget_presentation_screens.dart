import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../resource/values_manager.dart';
import 'model_presentation_screens.dart';
//ToDo BuildOneBoardingItem
class BuildBoardingItem extends StatelessWidget {

  final BoardingModel model  ;
   BuildBoardingItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image(
            image: AssetImage(model.image),
          ),
        ),
        const SizedBox(
          height: AppSize.s14,
        ),
        Text(
          model.title,
          style:  TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          model.subTitle,
          style:  TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.normal,
          

          ),
        ),
        const SizedBox(
          height: AppSize.s14,
        ),
      ],
    ) ;
  }
}
