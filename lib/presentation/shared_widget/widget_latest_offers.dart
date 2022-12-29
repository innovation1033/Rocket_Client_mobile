import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:client_rocket/business_logic/models/offer_model.dart';
import 'package:client_rocket/presentation/shared_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../resource/colors_manager.dart';
import '../../resource/images_manager.dart';

class BuildWidgetLatestOffersItem extends StatelessWidget {

  Offer? offerList;

  BuildWidgetLatestOffersItem(this.offerList);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal:1.h,vertical: 1.h),
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
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
                    Text(
                      'عرض أسعار زمان',
                      style: TextStyle(fontFamily: 'hanimation',fontSize: 12.sp, color: Colors.grey,fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${offerList!.title}' ,
                      style: TextStyle(fontFamily: 'hanimation',fontSize: 10.sp, color: Colors.black),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
            defaultButton(context, text: "أشترك الان", onPressed: (){
              AwesomeDialog(
                context: context,
                dialogType: DialogType.success,
                animType: AnimType.rightSlide,
                title: 'تم أرسال طلبك بنجاح سيتم التواصل معاك من خلال فريق خدمة العملاء',
                titleTextStyle: TextStyle(fontSize: 12.sp),
                padding: EdgeInsets.all(2.h),


              ).show();
            }, widthButton: 35.w, borderRadius: 6, colorButton: ColorManager.yellowColor, fontSize: 10.sp, heightButton: 4.5.h,)
          ],
        ),
      ),
    );
  }
}
