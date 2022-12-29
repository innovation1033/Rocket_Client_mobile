import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:client_rocket/presentation/home_layot/calculate_shipment_screens/Models/item_product_model.dart';
import 'package:client_rocket/presentation/home_layot/calculate_shipment_screens/cubit_caluclate_shipment/caluclate_shipment_cubit.dart';
import 'package:client_rocket/presentation/home_layot/calculate_shipment_screens/widgets_calculate_shipment_screens/devices_widget.dart';
import 'package:client_rocket/presentation/home_layot/calculate_shipment_screens/widgets_calculate_shipment_screens/widget_shipment.dart';
import 'package:client_rocket/presentation/home_layot/calculate_shipment_screens/widgets_calculate_shipment_screens/widget_shipment_tabview.dart';
import 'package:client_rocket/presentation/shared_widget/card_item.dart';
import 'package:client_rocket/presentation/shared_widget/custom_button.dart';
import 'package:client_rocket/presentation/shared_widget/custom_button_widget.dart';
import 'package:client_rocket/presentation/shared_widget/custom_dropdownbutton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:sizer/sizer.dart';
import '../../../resource/colors_manager.dart';
import '../../../resource/images_manager.dart';
import '../../../resource/routes_manager.dart';
import '../../shared_widget/custom_appbar.dart';
import '../../shared_widget/custom_textFormField_widget.dart';

class CalculateShipment extends StatefulWidget {
  const CalculateShipment({Key? key}) : super(key: key);

  @override
  State<CalculateShipment> createState() => _ShipmentsScreenState();
}

class _ShipmentsScreenState extends State<CalculateShipment> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CaluclateShipmentCubit, CaluclateShipmentState>(
      listener: (context, state) {
        var cubit=CaluclateShipmentCubit.get(context);
        if(state is SucessCalculateShipmentsState)
          {
            cubit.reset();
            AwesomeDialog(
                context: context,
                dialogType: DialogType.success,
                animType: AnimType.rightSlide,
                title: 'تم أضافه الشحنه بنجاح',
                padding: EdgeInsets.all(2.h)

        ).show();


          }
      },
      builder: (context, state) {
        var cubit=CaluclateShipmentCubit.get(context);
        return Scaffold(
          appBar: customAppBar(context,
            title: 'أحسب شحنتك',
          ),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 1.h),
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 2.h,),
                      CustomDropDownButton(hint: 'أختر العربيه',itemList: cubit.cars,textValidation:  'أختر العربيه',
                          onChanged:(value) {
                            print("carId=${value.id.toString()},${value.carWeight}");
                            cubit.carId=value.id;
                            cubit.changeCarWeight(value);
                          }),
                      SizedBox(height: 1.h,),
                      Row(
                        children: [
                          Expanded(
                            child:CustomDropDownButton(hint: 'أختر محافظة التحرك',itemList: cubit.allCountriesMove,textValidation:  'أختر المحافظة',
                                onChanged:(value) {
                                  cubit.formKeyDropDown1.currentState!.reset();
                                  cubit.formKeyDropDown2.currentState!.reset();
                                  cubit.formKeyDropDown3.currentState!.reset();
                                  print("currentIdCityMove=${value.id.toString()}");
                                  cubit.currentIdCityMove=value.id;
                                  cubit.onCountryChangeMove(value);

                                }),
                          ),
                          SizedBox(width: 2.h,),
                          Expanded(
                            child:Form(
                              key: cubit.formKeyDropDown1,
                              child: CustomDropDownButton(hint: 'أختر منطقة التحرك',itemList: cubit.allCitiessMove,textValidation:  'أختر المحافظة',
                                  onChanged: (value) {
                                    cubit.formKeyDropDown2.currentState!.reset();
                                    cubit.formKeyDropDown3.currentState!.reset();
                                    print("currentIdStateMove=${value.id.toString()}");
                                    cubit.currentIdStateMove=value.id;
                                  }),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 1.h,),
                      Row(
                        children: [
                          Expanded(
                            child:Form(
                              key: cubit.formKeyDropDown2,
                              child: CustomDropDownButton(hint: 'أختر محافظة الوصول',itemList: cubit.allCountriesArrived,textValidation:  'أختر المحافظة',
                                  onChanged:(value) {
                                    cubit.formKeyDropDown3.currentState!.reset();
                                    print("currentIdCityArrived=${value.id.toString()}");
                                    cubit.currentIdCityArrived=value.id;
                                    cubit.onCountryChangeArrived(value);

                                  }),
                            ),
                          ),
                          SizedBox(width: 2.h,),
                          Expanded(
                            child:Form(
                              key: cubit.formKeyDropDown3,
                              child: CustomDropDownButton(hint: 'أختر منطقة الوصول',itemList: cubit.allCitiessArrived,textValidation:  'أختر المحافظة',
                                  onChanged: (value) {
                                    print("currentIdStateArrived=${value.id.toString()}");
                                    cubit.  currentIdStateArrived=value.id;
                                  }),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 1.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${cubit.brokeText}",style: TextStyle(fontSize: 10.sp)),
                          SizedBox(width: 5.h,),
                          FlutterSwitch(
                            height: 3.h,
                            width: 8.h,
                            padding: 4.0,
                            toggleSize: 15.0,
                            borderRadius: 20,
                            activeColor: ColorManager.primaryColor,
                            value:cubit.isBreakable==0?false:true,
                            onToggle: (value) {
                              log(".....${value}");
                              cubit.changeBreakableState(value);
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 1.h,),
                      Form(
                        key: cubit.formAddProduct,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CustomTextFormFieldWithExpanded(
                                    textEditingController:
                                    cubit.nameProductController,
                                    isPassword: false,
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('',
                                          style: TextStyle(
                                            height: 2.1,
                                            color: ColorManager
                                                .primaryColor,
                                          )),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty)
                                        return 'برجاء ادخال أسم المنتج';
                                    },
                                    text: 'أدخل أسم المنتج',
                                    keyBoardType:
                                    TextInputType.text),
                                CustomTextFormFieldWithExpanded(
                                    textEditingController:
                                    cubit.longController,
                                    isPassword: false,
                                    suffixIcon: Padding(
                                      padding:
                                      const EdgeInsets.all(8.0),
                                      child: Text('CM',
                                          style: TextStyle(
                                            height: 2.1,
                                            color: ColorManager
                                                .primaryColor,
                                          )),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty)
                                        return 'برجاء ادخال الطول';
                                    },
                                    text: 'أدخل الطول',
                                    keyBoardType:
                                    TextInputType.number),

                              ],
                            ),
                            Row(
                              children: [
                                CustomTextFormFieldWithExpanded(
                                    textEditingController:
                                    cubit.widthController,
                                    isPassword: false,
                                    suffixIcon: Padding(
                                      padding:
                                      const EdgeInsets.all(8.0),
                                      child: Text('',
                                          style: TextStyle(
                                            height: 2.1,
                                            color: ColorManager
                                                .primaryColor,
                                          )),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty)
                                        return 'برجاء ادخال العرض';
                                    },
                                    text: 'أدخل العرض',
                                    keyBoardType:
                                    TextInputType.number),
                                CustomTextFormFieldWithExpanded(
                                    textEditingController:
                                    cubit.heightController,
                                    isPassword: false,
                                    suffixIcon: Padding(
                                      padding:
                                      const EdgeInsets.all(8.0),
                                      child: Text('CM',
                                          style: TextStyle(
                                            height: 2.1,
                                            color: ColorManager
                                                .primaryColor,
                                            fontFamily:
                                            "hanimation",
                                          )),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty)
                                        return 'برجاء ادخال الارتفاع';
                                    },
                                    text: 'أدخل الارتفاع',
                                    keyBoardType:
                                    TextInputType.number),

                              ],
                            ),
                            Row(
                              children: [
                                CustomTextFormFieldWithExpanded(
                                    textEditingController:
                                    cubit.countController,
                                    isPassword: false,
                                    suffixIcon: Padding(
                                      padding:
                                      const EdgeInsets.all(8.0),
                                      child: Text('',
                                          style: TextStyle(
                                            height: 2.1,
                                            color: ColorManager
                                                .primaryColor,
                                          )),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty)
                                        return 'برجاء ادخال العدد';
                                    },
                                    text: 'أدخل العدد',
                                    keyBoardType:
                                    TextInputType.number),
                                Expanded(
                                  child: Container(
                                      height: 6.h,
                                      margin: EdgeInsetsDirectional.only(end: 2.h),
                                      decoration: BoxDecoration(
                                        color: ColorManager.yellowColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(onPressed: () {
                                        if (cubit.formAddProduct.currentState!.validate()) {
                                          cubit.addToProductList(itemProductModel: ItemProductModel(nameProduct:cubit.nameProductController.text,long:int.parse( cubit.longController.text),width: int.parse(cubit.widthController.text),height:int.parse(cubit.heightController.text),count:int.parse(cubit.countController.text),weight:int.parse(cubit.widthController.text)*int.parse(cubit.longController.text)*int.parse(cubit.heightController.text)*int.parse(cubit.countController.text),price:(int.parse(cubit.widthController.text)*int.parse(cubit.longController.text)*int.parse(cubit.heightController.text)*int.parse(cubit.countController.text)*cubit.price!)));
                                          cubit.longController.clear();
                                          cubit.countController.clear();
                                          cubit.heightController.clear();
                                          cubit.widthController.clear();
                                          cubit.nameProductController.clear();
                                        }
                                      },icon: Icon(Icons.add, color: Colors.white,))),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      CardItem(buildYourContainer: Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                      Text("وزن العربيه: ${cubit.carWeight}  ",
                          style: TextStyle(fontSize: 10.sp)),
                      SizedBox(width: 1.h,),
                      Text("الوزن المتبقي: ${cubit.getRemainingWeight()}",
                          style: TextStyle(fontSize: 10.sp)),
                      SizedBox(width: 1.h,),
                      Text("السعر : ${cubit.getTotalPrice()}",
                          style: TextStyle(fontSize: 10.sp)),
                      SizedBox(width: 1.h,),
                    ],
                  ),marginBottom: 1.h,marginEnd: 0.h,marginStart: 0.h,marginTop: 1.h,),
                      ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            Container(
                              child: Card(
                                 elevation: 3,
                                child: ListTile(
                                  title: Text("${cubit.itemProductList[index].nameProduct}",
                                      style: TextStyle(fontSize: 10.sp)),
                                  subtitle: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("الطول : ${cubit.itemProductList[index].long} ",
                                              style: TextStyle(fontSize: 10.sp)),
                                          SizedBox(width: 1.h,),
                                          Text("العرض : ${cubit.itemProductList[index].width} ",
                                              style: TextStyle(fontSize: 10.sp)),
                                          SizedBox(width: 1.h,),
                                          Text("الارتفاع : ${cubit.itemProductList[index].height}",
                                              style: TextStyle(fontSize: 10.sp)),
                                          SizedBox(width: 1.h,),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("العدد : ${cubit.itemProductList[index].count}  ",
                                              style: TextStyle(fontSize: 10.sp)),
                                          SizedBox(width: 1.h,),
                                          Text("الوزن : ${cubit.itemProductList[index].weight}",
                                              style: TextStyle(fontSize: 10.sp)),
                                          SizedBox(width: 1.h,),
                                          Text("السعر : ${cubit.itemProductList[index].price}",
                                              style: TextStyle(fontSize: 10.sp)),
                                          SizedBox(width: 1.h,),
                                        ],
                                      ),

                                    ],
                                  ),
                                  dense: true,
                                  trailing: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.redAccent
                                    ),
                                    child: Icon(Icons.delete),
                                    onPressed: () {
                                      cubit.deleteProductFromList(index);
                                    },
                                  ),
                                ),
                              ),
                            ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 1.h),
                        itemCount: cubit.itemProductList.length,
                      ),
                      SizedBox(height: 2.h,),
                      defaultButton(context, text: "إتمام الشحنة", onPressed: (){
                        if(cubit.formKey.currentState!.validate()
                            &&cubit.formKeyDropDown1.currentState!.validate()
                            &&cubit.formKeyDropDown2.currentState!.validate()
                            &&cubit.formKeyDropDown3.currentState!.validate())
                          {
                            print("!!!+++++++++");
                            if(cubit.itemMapOfProductList.isNotEmpty)
                              {
                                if(cubit.getRemainingWeight()>=0)
                                  {
                                    print("########+++");
                                    cubit.calculateShipments();
                                  }
                                else{
                                  {
                                    print("########-----");
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                        SnackBar(
                                          content: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: Text(
                                                "وزن المنتجات أكبر من وزن العربية"),
                                          ),
                                          backgroundColor: Colors.red,
                                        ));
                                  }
                                }



                              }
                            else {
                              ScaffoldMessenger.of(context)
                                .showSnackBar(
                                SnackBar(
                              content: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Text(
                                    "برجاء ادخال المنتجات"),
                              ),
                              backgroundColor: Colors.red,
                            ));
                            }


                          }


                      }, widthButton: 60.w, borderRadius: 15, colorButton: ColorManager.primaryColor, fontSize: 12.sp, heightButton: 5.h)
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

}
