
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../resource/colors_manager.dart';
import '../../resource/images_manager.dart';
import '../../resource/routes_manager.dart';
import '../../resource/strings_manager.dart';
import '../../resource/values_manager.dart';
import '../shared_widget/custom_button_widget.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20.0 ,
              right: 20.0 ,
              top: 40  ,
              bottom: 40
            ),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Center(
                    child: Image(
                      image: const AssetImage(
                        ImageAssets.boltLogo ,
                      ),
                      height: 30.h,
                      width: 30.h,
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s40,
                  ),
                  Text(
                      AppStrings.createScreenTitle ,
                      style: TextStyle(
                        color: ColorManager.primaryColor ,
                        fontSize: 24 ,
                        fontWeight: FontWeight.bold ,
                        wordSpacing: 2.5
                      ),
                  ),
                  const Text(
                      AppStrings.createScreenSubTitle ,
                    style: TextStyle(
                      color: Colors.black ,
                      fontSize: 20 ,
                      fontWeight: FontWeight.w400 ,
                  ),
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  CustomButton(
                    text: 'تسجيل الدخول',
                    function: (){
                      Navigator.pushNamed(context, Routes.loginScreen) ;
                    },
                    color: ColorManager.yellowColor,
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  CustomButton(
                    text: 'أنشاء حساب جديد',
                    function: (){
                      Navigator.pushNamed(context, Routes.registerScreenByPhone) ;
                    },
                    color: ColorManager.primaryColor,

                  ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
