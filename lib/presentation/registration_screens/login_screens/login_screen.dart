import 'package:client_rocket/business_logic/cubit_registeration/registeration_cubit_class.dart';
import 'package:client_rocket/business_logic/cubit_registeration/states.dart';
import 'package:client_rocket/helper_methods/functions_needed/functions.dart';
import 'package:client_rocket/presentation/home_layot/calculate_shipment_screens/calculate%20_shipment.dart.dart';
import 'package:client_rocket/presentation/home_layot/home_layout.dart';
import 'package:client_rocket/presentation/home_layot/shipments_screens/current_shipments_widget.dart';
import 'package:client_rocket/presentation/registration_screens/register_screens/register_screen.dart';
import 'package:client_rocket/presentation/shared_widget/custom_button.dart';
import 'package:client_rocket/presentation/shared_widget/custom_button_widget.dart';
import 'package:client_rocket/presentation/shared_widget/custom_textFormField_widget.dart';
import 'package:client_rocket/resource/colors_manager.dart';
import 'package:client_rocket/resource/constants_manager.dart';
import 'package:client_rocket/resource/images_manager.dart';
import 'package:client_rocket/resource/routes_manager.dart';
import 'package:client_rocket/resource/values_manager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../home_layot/calculate_shipment_screens/finish_order_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return BlocConsumer<RegisterationCubitClass, RegisterStates>(
  listener: (context, state) {
    // TODO: implement listener
    var cubit=RegisterationCubitClass.get(context);
    if(state is LoginSuccessState)
      {
        cubit.phoneController.clear();
        cubit.passWordController.clear();
        navigateAndRemove(context, HomeLayoutScreen());
      }
    else if(state is ShowErrorInSnackBar)
      showToast(message:cubit.errorMessage , state: ToastStates.ERORR);
  },
  builder: (context, state) {
    var cubit=RegisterationCubitClass.get(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 40, bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Center(
                    child: Image.asset(
                      ImageAssets.boltLogo,
                      width: 20.h,
                      height: 40.h,
                    ),
                  ),
                  SizedBox(height: 1.5.h),
                  defaultFormField(
                    controller:cubit.phoneController,
                    suffixicon: starSuffixIcon(),
                    prefixIcon: Icons.phone_android,
                    isPrefixIcon: true,
                    keyboardtype:  TextInputType.phone,
                    labelText:"التليفون",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return validateMobile(value!);
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: AppSize.s12,
                  ),
                  defaultFormField(
                    controller:cubit.passWordController,
                    suffixicon: InkWell(child:Icon(!cubit.isPasswordLogin?  Icons.visibility_off : Icons.remove_red_eye,color:ColorManager.primaryColor),onTap: (){
                      cubit.makeItReadAbleLogin();
                    },),
                    obscuretext: cubit.isPasswordLogin? true : false,
                    keyboardtype:  TextInputType.visiblePassword,
                    labelText:"الباسورد",
                      prefixIcon: Icons.lock,
                      isPrefixIcon: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'برجاء إدخال الباسورد';
                      }
                      if (value.length < 8) {
                        return 'لايجب ان يقل الباسورد عن 8 احرف ';
                      }
                    }),
                  const SizedBox(
                    height: AppSize.s40,
                  ),
                  defaultButton(context,isLoading:state is LoginLoadingState, text:"تسجيل الدخول", onPressed: (){
                    if(formKey.currentState!.validate())
                    {
                      cubit.loginClient();
                    }

                  }, widthButton: 100.w,fontSize: 12.sp,heightButton: 6.h, borderRadius: 10, colorButton: ColorManager.primaryColor),
                /*  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, Routes.resetPasswordScreenByPhone);
                    },
                    child: Text(
                      'نسيت كلمه السر ؟',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: fontFamily,
                        color: ColorManager.primaryColor,
                      ),
                    ),
                  ),*/
                  Padding(
                    padding:  EdgeInsets.all(.5.h),
                    child: RichText(text: TextSpan(
                      text:  'إنشاء حساب جديد ',
                      style: TextStyle(color: Colors.black,fontSize:10.sp,fontFamily: fontFamily),
                      children:  <TextSpan>[
                        TextSpan(text: " أضغط هنا ", style: TextStyle(color:ColorManager.primaryColor,fontSize:10.sp,fontFamily: fontFamily),
                          recognizer:TapGestureRecognizer()..onTap = () {
                            navigateAndFinish(context, layout: RegisterScreen());
                          },)
                      ],
                    ),),
                  ),
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

