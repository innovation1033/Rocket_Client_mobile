import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:client_rocket/Map_sccc.dart';
import 'package:client_rocket/helper_methods/functions_needed/functions.dart';
import 'package:client_rocket/presentation/home_layot/profile_screens/map/map_cubit.dart';
import 'package:client_rocket/presentation/home_layot/profile_screens/map/map_screen.dart';
import 'package:client_rocket/presentation/shared_widget/card_item.dart';
import 'package:client_rocket/presentation/shared_widget/custom_button.dart';
import 'package:client_rocket/presentation/shared_widget/custom_row_for_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../../resource/colors_manager.dart';

class CurrentShipmentsWidget extends StatelessWidget {

  var OrderNumber,shipmentName,shipmentDescription,totalPrice,isBreakable;
  int? numberOfStatus;
  List? startMap,distnationMap,Map;
  int? representativeID;

  CurrentShipmentsWidget({this.OrderNumber, this.shipmentName,this.startMap,this.distnationMap,this.representativeID,
    this.shipmentDescription, this.totalPrice, this.isBreakable,this.numberOfStatus,this.Map});

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
          subtitle:StepperText("خروج المندوب") ,
          iconWidget: Container(
            decoration:  BoxDecoration(
                color: ColorManager.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: const Icon(Icons.looks_3, color: Colors.white),
          )
      ),
      StepperData(
        subtitle: StepperText(""),
          iconWidget: Container(
            decoration:  BoxDecoration(
                color: ColorManager.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: const Icon(Icons.looks_4, color: Colors.white),
          )
      ),
    ];
    return CardItem(buildYourContainer: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomRowForDetails(text1: "رقم بوليصة الشحن",text2:"$OrderNumber" ,),
        CustomRowForDetails(text1: "أسم الشحنة",text2:"$shipmentName" ,),
        CustomRowForDetails(text1: "وصف الشحنة",text2:"$shipmentDescription" ,),
        CustomRowForDetails(text1: "السعر الاجمالي",text2:"$totalPrice" ,),
        CustomRowForDetails(text1: "قابل للكسر",text2:"${isBreakable==1?"نعم":"لا"}" ,),
        if(numberOfStatus==3)
        defaultButton(context, text: "تتبع الشحنة علي الخريطة", onPressed: (){
          print("representativeID>>${representativeID}");
          if(Map!.isNotEmpty) {
            //MapCubit.get(context).getUser(docName: 4);
            navigateAndBack(context, layout: MapScreen(
              startMap:startMap,
              distnationMap:distnationMap,
              representativeID: representativeID,

            ));
        //   navigateAndBack(context, layout: MapErorr());
          } else {
            showToast(message: "المندوب لم يتحرك بعد", state: ToastStates.ERORR);
          }
        }, widthButton: 40.w, borderRadius: 10, colorButton: ColorManager.primaryColor, fontSize: 10.sp, heightButton: 4.5.h),
        SizedBox(height: 1.h,),
        AnotherStepper(
          barThickness: .5.h,
          stepperList: stepperData,
          inverted: true,
          stepperDirection: Axis.horizontal,
          activeIndex: (numberOfStatus==10||numberOfStatus==1)?0:(numberOfStatus==2||numberOfStatus==6)?1:2,
          activeBarColor:ColorManager.primaryColor,
          iconWidth: 60, // Height that will be applied to all the stepper icons
          iconHeight: 60, // Width that will be applied to all the stepper icons
        )
      ],
    ),marginTop: 10,marginEnd: 10,marginBottom: 5,marginStart: 10);
  }
}
