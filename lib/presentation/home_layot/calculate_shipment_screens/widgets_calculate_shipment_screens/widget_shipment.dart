import 'package:client_rocket/resource/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../business_logic/home_cubit/home_cubit.dart';
import '../../../../business_logic/home_cubit/home_state.dart';
import '../../../../resource/colors_manager.dart';
import '../../../../resource/values_manager.dart';
import '../../../shared_widget/custom_button_widget.dart';
import '../../../shared_widget/custom_textFormField_widget.dart';

class ShipmentWidget extends StatefulWidget {
  ShipmentWidget({required this.onChange , Key? key}) : super(key: key);
  Function onChange ;

  @override
  State<ShipmentWidget> createState() => _ShipmentWidgetState();
}

class _ShipmentWidgetState extends State<ShipmentWidget> {

  @override
  Widget build(BuildContext context) {


    var formKey = GlobalKey<FormState>();
    var heightController = TextEditingController();
    var widthController = TextEditingController();
    var longController = TextEditingController();
    var sizeController = TextEditingController();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 3.h,
                ),
                CustomTextFormFieldWithExpanded(
                    textEditingController:
                    longController,
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
                SizedBox(
                  height: 3.h,
                ),
                CustomTextFormFieldWithExpanded(
                    textEditingController:
                    widthController,
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
                        return 'برجاء ادخال العرض';
                    },
                    text: 'أدخل العرض',
                    keyBoardType:
                    TextInputType.number),
                SizedBox(
                  height: 3.h,
                ),
                CustomTextFormFieldWithExpanded(
                    textEditingController:
                    heightController,
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
                SizedBox(
                  height: AppSize.s1_5,
                ),
                Text(
                  'حجم شحنتك : يتم حساب الحجم تلقائيا',
                  style: TextStyle(
                    color:
                    ColorManager.primaryColor,
                    fontSize: 20,
                    
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                CustomTextFormFieldWithExpanded(
                    textEditingController:
                    sizeController,
                    isPassword: false,
                    suffixIcon: Padding(
                      padding:
                      const EdgeInsets.all(8.0),
                      child: Text('KG',
                          style: TextStyle(
                            height: 2.1,
                            color: ColorManager
                                .primaryColor,
                          )),
                    ),
                    validator: (value) {
                      if (value!.isEmpty)
                        return 'برجاء ادخال الوزن';
                    },
                    text: 'أدخل الوزن',
                    keyBoardType:
                    TextInputType.number),
                SizedBox(
                  height: 3.h,
                ),
                CustomButton(
                  function: () {
                    if (longController.text.isEmpty ||
                        sizeController
                            .text.isEmpty ||
                        heightController
                            .text.isEmpty ||
                        widthController
                            .text.isEmpty) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        SnackBar(
                          content: Text(
                              "برجاء ادخال باقي البيانات"),
                          backgroundColor:
                          Colors.red,
                        ),
                      );
                    } else {

                      Navigator.pushNamed(
                          context, Routes.shipmentFromScreen);
                    }
                  },
                  text: 'التالي',
                  color: ColorManager.primaryColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
