import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:timer_count_down/timer_count_down.dart';
import '../../../resource/colors_manager.dart';
import '../../../resource/images_manager.dart';
import '../../../resource/routes_manager.dart';
import '../../../resource/strings_manager.dart';
import '../../../resource/values_manager.dart';
import '../../shared_widget/custom_button_widget.dart';
import '../share_widget_to_registration_screens/custom_pin_code.dart';

class MessageScreenToForgetPassword extends StatefulWidget {
  const MessageScreenToForgetPassword({Key? key, this.phone}) : super(key: key);
  final phone;

  @override
  State<MessageScreenToForgetPassword> createState() =>
      _MessageScreenToForgetPasswordState();
}

class _MessageScreenToForgetPasswordState extends State<MessageScreenToForgetPassword> {
  late String otpCode;

  @override
  Widget build(BuildContext context) {
    bool timeFinish = false;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 40, bottom: 40),
            child: Column(
              textDirection: TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Center(
                  child: Image(
                    image: const AssetImage(
                      ImageAssets.otpLogoScreen,
                    ),
                    height: 40.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s40,
                ),
                const Text(
                  'برجاء أدخال رمز التأكيد',
                  style: TextStyle(
                      color: Colors.black, fontSize: 18, wordSpacing: 2.5),
                ),
                CustomPinCode(
                  onCompleted: (code) {
                    otpCode = code;
                    print('${code} is Completed');
                  },
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                timeFinish == false
                    ? CustomButton(
                        function: () {
                          Navigator.pushNamed(
                              context, Routes.restNewPassword);
                        },
                        color: ColorManager.primaryColor,
                        text: 'التاكيد')
                    : CustomButton(
                        function: () {
                          setState(() {
                            timeFinish = false;
                          });
                        },
                        color: ColorManager.primaryColor,
                        text: 'ارسال كود التفعيل مره اخري'),
                const SizedBox(
                  height: AppSize.s4,
                ),
                const Center(
                  child: Text(
                    AppStrings.otpScreenText,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    timeFinish == false
                        ? Countdown(
                            seconds: 60,
                            build: (BuildContext context, double time) =>
                                Text(
                              '(${time.toString()})',
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            interval: const Duration(milliseconds: 100),
                            onFinished: () {
                              setState(() {
                                timeFinish = true;
                              });
                              print('Timer is done!');
                            },
                          )
                        : Text(
                            '(0.0)',
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                    const SizedBox(
                      width: AppSize.s14,
                    ),
                    const Text(
                      'ارسال رمز التأكيد مرة أخري',
                      textDirection: TextDirection.ltr,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
