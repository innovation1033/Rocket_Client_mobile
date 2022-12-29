import 'package:client_rocket/presentation/home_layot/calculate_shipment_screens/widgets_calculate_shipment_screens/alertdialog_to_success_order.dart';
import 'package:client_rocket/presentation/home_layot/calculate_shipment_screens/widgets_calculate_shipment_screens/widget_of_toggle_yes_or_no.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../../../resource/colors_manager.dart';
import '../../../resource/images_manager.dart';
import '../../../resource/routes_manager.dart';
import '../../../resource/values_manager.dart';
import '../../shared_widget/custom_button_widget.dart';

class FinishOrderScreen extends StatefulWidget {
  const FinishOrderScreen({Key? key}) : super(key: key);

  @override
  State<FinishOrderScreen> createState() => _finishOrderScreenState();
}

class _finishOrderScreenState extends State<FinishOrderScreen> {
  int radioGroup1 = 2;

  int radioGroup2 = 2;
  int radioGroup3 = 2;

  bool toggleContainerBroken = true;

  @override
  final ImagePicker _picker = ImagePicker();
  XFile? image;

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorManager.myWhite,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: AppSize.s1_5,
                ),
                ToggleToYesOrNo(
                  text: 'هل الشحنة تحتاج شيال',
                  radioGroup: radioGroup1,
                ),
                const SizedBox(
                  height: AppSize.s1_5,
                ),
                ToggleToYesOrNo(
                  text: 'هل الشحنة تحتاج فك وتركيب ',
                  radioGroup: radioGroup2,
                ),
                const SizedBox(
                  height: AppSize.s1_5,
                ),
                ToggleToYesOrNo(
                    text: 'هل الشحنة تحتاج تغليف', radioGroup: radioGroup3),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                toggleContainerBroken = true;
                              });
                            },
                            child: Container(
                              height: 8.h,
                              width: 45.w,
                              decoration: BoxDecoration(
                                color: toggleContainerBroken == true
                                    ? ColorManager.primaryColor
                                    : ColorManager.yellowColor,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 32.w,
                                  ),
                                  const Text(
                                    'لا',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                toggleContainerBroken = false;
                              });
                            },
                            child: Container(
                              width: 30.w,
                              height: 8.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: toggleContainerBroken == true
                                    ? ColorManager.yellowColor
                                    : ColorManager.primaryColor,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'نعم',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'القابلية للكسر',
                      style: TextStyle(
                        fontSize: 24,
                        color: ColorManager.yellowColor,
                        fontFamily: 'hanimation',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                TextButton(
                    onPressed: () {
                      setState(() async {
                        image = await _picker.pickImage(
                            source: ImageSource.gallery);
                      });
                    },
                    child: image == null
                        ? Text(
                            'رفع صورة للشحنة(اختياري)',
                            style: TextStyle(
                              color: ColorManager.primaryColor,
                              fontSize: 24,
                              fontFamily: 'hanimation',
                            ),
                          )
                        : Text(
                            'تم ارسال صوره الشحنه بنجاح',
                            style: TextStyle(
                              color: ColorManager.primaryColor,
                              fontSize: 24,
                              fontFamily: 'hanimation',
                            ),
                          )),
                SizedBox(
                  height: 1.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: CustomButton(
                    function: () {
                      showDialog(
                          context: context,
                          builder: (_) => const AlertDialogToSuccessOrder());
                    },
                    text: 'تاكيد',
                    color: ColorManager.primaryColor,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
