
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../resource/colors_manager.dart';
import '../../../resource/images_manager.dart';
import '../../../resource/routes_manager.dart';
import '../../../resource/values_manager.dart';
import '../../shared_widget/custom_button_widget.dart';
import '../../shared_widget/custom_textFormField_widget.dart';


class ResetPasswordByPhone extends StatelessWidget {

  final phone ;

  ResetPasswordByPhone({Key? key, this.phone}) : super(key: key);

  TextEditingController phoneController = TextEditingController() ;
  var formKey = GlobalKey<FormState>() ;
  String generateCountryFlag() {
    String countryCode = 'eg';

    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
            (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));

    return flag;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:SingleChildScrollView(
          child: Form(
            key: formKey,
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
                        image:  const AssetImage(
                          ImageAssets.phoneLogoScreen ,
                        ),
                        height: 40.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s40,
                    ),
                    CustomTextFormField(
                      text: 'رقم الهاتف',
                      isPassword: false,
                      suffixIcon:Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          generateCountryFlag() + ' 20',
                          style: const TextStyle(
                            fontSize: 18,
                          

                            height: 2.1 ,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ) ,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'برجاء إدخال رقم الهاتف';
                        }   if (value.length != 11) {
                          return 'رقم الهاتف غير صحيح ';
                        }
                        String check = value.substring(0, 3);
                        if (check != '010' &&
                            check != '012' &&
                            check != '011' &&
                            check != '015') {
                          return 'رقم الهاتف غير صحيح' ;
                        }

                      },
                      keyBoardType: TextInputType.phone,
                      textEditingController: phoneController,
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    CustomButton(
                      text: 'تسجيل',
                      function: (){
                        if(formKey.currentState!.validate()){
                          Navigator.pushNamed(context, Routes.messageScreenToForgetPassword ,
                              arguments:phoneController.text
                          ) ;}
                      },
                      color: ColorManager.primaryColor,

                    ),
                    const SizedBox(
                      height: AppSize.s4,
                    ),
                    const Text(
                      'سوف يتم أرسال رسالة نصية لتأكيد رقم الموبايل' ,
                      style: TextStyle(
                          color: Colors.black ,
                        

                          fontSize: 18 ,
                          wordSpacing: 2.5
                      ),
                    ),


                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
