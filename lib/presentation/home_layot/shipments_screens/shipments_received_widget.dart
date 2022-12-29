import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:client_rocket/presentation/shared_widget/card_item.dart';
import 'package:client_rocket/presentation/shared_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../resource/colors_manager.dart';
import '../../shared_widget/custom_row_for_details.dart';

class ShipmentsReceivedWidget extends StatelessWidget {
  var OrderNumber,shipmentName,shipmentDescription,totalPrice,isBreakable,nameStatus;
  int? numberOfStatus;

  ShipmentsReceivedWidget({this.OrderNumber, this.shipmentName,this.nameStatus,
    this.shipmentDescription, this.totalPrice, this.isBreakable,this.numberOfStatus});

  @override
  Widget build(BuildContext context) {
        List<StepperData> stepperData = [
      StepperData(
          subtitle: StepperText("طلب"),
          iconWidget: Container(
            decoration:  BoxDecoration(
                color: ColorManager.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: const Icon(Icons.looks_one, color: Colors.white),
          )
      ),
      StepperData(
          subtitle: StepperText("تحضير"),
          iconWidget: Container(
            decoration:  BoxDecoration(
                color: ColorManager.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: const Icon(Icons.looks_two, color: Colors.white),
          )
      ),
      StepperData(
          subtitle:StepperText("خروج المندوب"),
          iconWidget: Container(
            decoration:  BoxDecoration(
                color: ColorManager.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: const Icon(Icons.looks_3, color: Colors.white),
          )
      ),
      StepperData(
          subtitle: StepperText("$nameStatus"),
          iconWidget: Container(
            decoration:  BoxDecoration(
                color: ColorManager.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: const Icon(Icons.looks_4, color: Colors.white),
          )
      ),
    ];

    return CardItem(buildYourContainer: Container(
      color: ColorManager.myWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
            Column(
             children: [
            CustomRowForDetails(text1: "رقم بوليصة الشحن",text2:"$OrderNumber" ,),
            CustomRowForDetails(text1: "أسم الشحنة",text2:"$shipmentName" ,),
            CustomRowForDetails(text1: "وصف الشحنة",text2:"$shipmentDescription" ,),
            CustomRowForDetails(text1: "السعر الاجمالي",text2:"$totalPrice" ,),
            CustomRowForDetails(text1: "قابل للكسر",text2:"${isBreakable==1?"نعم":"لا"}" ,),
          ],
        ),
          SizedBox(height: 1.h,),
          AnotherStepper(
            barThickness: .5.h,
            stepperList: stepperData,
            inverted: true,
            stepperDirection: Axis.horizontal,
            activeIndex: 3,
            activeBarColor:ColorManager.primaryColor,
            iconWidth: 60, // Height that will be applied to all the stepper icons
            iconHeight: 60, // Width that will be applied to all the stepper icons
          )
        ],
      ),
    ),marginTop: 10,marginEnd: 10,marginBottom: 5,marginStart: 10);
  }
}
