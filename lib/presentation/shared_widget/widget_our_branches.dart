import 'package:client_rocket/business_logic/models/all_branches.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../resource/colors_manager.dart';
import '../../resource/images_manager.dart';

class BuildItemOneBranches extends StatelessWidget {
  Branches? branches;

  BuildItemOneBranches(this.branches);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal:1.h,vertical: 1.h),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: ColorManager.yellowColor,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              height: 8.h,
              width: 15.w,

              child: SvgPicture.asset(ImageAssets.ourBranches,fit: BoxFit.cover,color: Colors.white),
            ),
            SizedBox(
              width: 5.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Row(
                  children:  [
                    Text(
                      '${branches!.area!.province!.name} - ',
                      style:
                      TextStyle(fontFamily: 'hanimation',fontSize: 18, color: Colors.black),
                    ),
                    Text(
                      '${branches!.name}',
                      style:
                      TextStyle(fontFamily: 'hanimation',fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.5,
                ),
                Text(
                  '${branches!.address}' ,
                  style: TextStyle(fontFamily: 'hanimation',fontSize: 16, color: Colors.black),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 1.5,
                ),
                Text(
                  '${branches!.phone}' ,
                  style: TextStyle(fontFamily: 'hanimation',fontSize: 16, color: Colors.black),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
