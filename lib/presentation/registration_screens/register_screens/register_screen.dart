import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:client_rocket/business_logic/cubit_registeration/registeration_cubit_class.dart';
import 'package:client_rocket/business_logic/cubit_registeration/states.dart';
import 'package:client_rocket/helper_methods/functions_needed/functions.dart';
import 'package:client_rocket/presentation/registration_screens/login_screens/login_screen.dart';
import 'package:client_rocket/presentation/shared_widget/custom_button.dart';
import 'package:client_rocket/presentation/shared_widget/register_dialog_widget.dart';
import 'package:client_rocket/resource/constants_manager.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../resource/colors_manager.dart';
import '../../../resource/images_manager.dart';
import '../../shared_widget/custom_dropdownbutton_widget.dart';
import '../../shared_widget/custom_textFormField_widget.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var formDropDown = GlobalKey<FormState>();
    var RegisterValidation = GlobalKey<FormState>();
    return BlocConsumer<RegisterationCubitClass, RegisterStates>(
      listener: (context, state) {
        var cubit = RegisterationCubitClass.get(context);
        if(state is RegisterClientErrorState)
        {
          ScaffoldMessenger.of(context)
              .showSnackBar(
              SnackBar(
                  content: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                        cubit.erorrMessage.toString(),
                    ),
                  ),
                backgroundColor: Colors.red,));
         // showToast(message: cubit.erorrMessage.toString(),state: ToastStates.ERORR);
        }
        if(state is RegisterClientSuccessState)
        {

          AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.rightSlide,
              title: 'تم التسجيل بنجاح',
              desc: "هل تريد الذهاب لتسجيل الدخول؟",
              btnCancelText: "إلغاء",
               btnOkText: "قبول",
               reverseBtnOrder: true,
              btnOkOnPress: (){
                navigateAndFinish(context, layout: LoginScreen());
                cubit.resetAll();
                RegisterValidation.currentState!.reset();
                formDropDown.currentState!.reset();
              },
            btnCancelOnPress: (){
                cubit.resetAll();
                RegisterValidation.currentState!.reset();
                formDropDown.currentState!.reset();
            },
              padding: EdgeInsets.all(2.h),


          ).show();

      /*    showGeneralDialog(
            context: context,
            barrierColor: Colors.black54,
            pageBuilder: (
                BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
              return RegisterAlertDialog(
                content: Column(
                  crossAxisAlignment:CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 8.h,),
                    Text(
                      "Welcome to your Client, a new success partner",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: fontFamily,
                          fontSize: MediaQuery.of(context).size.height * .022),
                    ),
                    SizedBox(height: 1.h,),
                    defaultButton(context, text: "الذهاب لتسجيل الدخول", onPressed: (){
                      navigateAndFinish(context, layout: LoginScreen());
                      cubit.resetAll();
                      RegisterValidation.currentState!.reset();
                      formDropDown.currentState!.reset();
                    }, widthButton: 40.w, borderRadius: 25, colorButton: ColorManager.primaryColor, fontSize: 12.sp, heightButton: 5.h),
                    SizedBox(height: 1.h,),

                  ],
                ),
                cardImgUrl: "Assets/images/Register.svg",
              );
            },
          );*/
        }
      },
      builder: (context, state) {
        var cubit = RegisterationCubitClass.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar:AppBar(
              toolbarHeight: 14.h,
              backgroundColor: ColorManager.primaryColor,
              centerTitle: true,
              foregroundColor: Colors.white,
              elevation: 0,
              leading: SizedBox(),
              title: Column(
                children: [
                  SvgPicture.asset(
                    "Assets/images/Register.svg",
                    width: 40.w,
                    height: 8.h,
                    color: Colors.white,
                  ),
                  Text(
                    "تسجيل الدخول",
                    style: TextStyle(fontSize: 25, height: 1.5),
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(2.h),
                child: Form(
                  key: RegisterValidation,
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Center(
                        child: Image.asset(
                          ImageAssets.boltLogo,
                          width: 10.h,
                          height: 10.h,
                        ),
                      ),
                      SizedBox(height: 1.5.h),
                      defaultFormField(
                        controller:cubit.userNameClientController,
                        keyboardtype:  TextInputType.text,
                        suffixicon: starSuffixIcon(),
                        labelText:"اسم المستخدم",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "برجاء ادخال اسم المستخدم";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 1.5.h),
                      defaultFormField(
                        controller:cubit.nameClientController,
                        suffixicon: starSuffixIcon(),
                        keyboardtype:  TextInputType.text,
                        labelText:"الاسم",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "برجاء ادخال الاسم";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 1.5.h),
                      defaultFormField(
                        controller:cubit.phoneForClientController,
                        suffixicon: starSuffixIcon(),
                        keyboardtype:  TextInputType.phone,
                        labelText:"التليفون",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return validateMobile(value!);
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 1.5.h),
                      defaultFormField(
                        controller:cubit.emailClientController,
                        keyboardtype:  TextInputType.emailAddress,
                        labelText:"الايميل",

                      ),
                      SizedBox(height: 1.5.h),
                      defaultFormField(
                        controller:cubit.passwordClientController,
                        obscuretext: cubit.isPasswordRegister ? true : false,
                        suffixicon:InkWell(child:Icon(!cubit.isPasswordRegister?  Icons.visibility_off : Icons.remove_red_eye,color:ColorManager.primaryColor),onTap: (){
                          cubit.makeItReadAbleRegister();
                        },),
                        keyboardtype:  TextInputType.visiblePassword,
                        labelText:"الباسورد",

                        validator: (value) {
                          if (value!.isEmpty) {
                            return "برجاء ادخال الباسورد  ";
                          }
                          else if  (value.length<8) {
                            return "برجاء ادخال الباسورد لا يقل عن 8 رموز ";
                          }

                          return null;
                        },
                      ),
                      SizedBox(height: 1.5.h),
                      defaultFormField(
                        controller:cubit.rePasswordClientController,
                        suffixicon: InkWell(child:Icon(!cubit.isPasswordconfirm?  Icons.visibility_off : Icons.remove_red_eye,color:ColorManager.primaryColor),onTap: (){
                          cubit.makeItReadAbleConfirmedRegister();
                        },),
                        obscuretext: cubit.isPasswordconfirm ? true : false,
                        keyboardtype:  TextInputType.visiblePassword,
                        labelText:"تأكيد الباسورد",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "برجاء ادخال الباسورد  ";
                          }
                          else if(cubit.passwordClientController.text!=cubit.rePasswordClientController.text)

                          {  return "برجاء ادخال الباسورد متطابق ";}

                          return null;
                        },

                      ),
                      SizedBox(height: 2.h),
                      Row(
                        children: [
                          Expanded(
                            child:CustomDropDownButton(hint: 'أختر المحافظة',itemList: cubit.allCountries,textValidation:  'أختر المحافظة',
                                onChanged:(value) {
                                  formDropDown.currentState!.reset();
                                  print("IDDDDDDDDD${value.id.toString()}");
                                  cubit.currentIdCity=value.id;
                                  cubit.onCountryChange(value);

                                }),
                          ),
                          SizedBox(width: 2.h,),
                          Expanded(
                            child:Form(
                              key: formDropDown,
                              child: CustomDropDownButton(hint: 'أختر المنطقة',itemList: cubit.allCitiess,textValidation:  'أختر المحافظة',
                                  onChanged: (value) {
                                    log(value.id.toString());
                                    cubit.currentIdState=value.id;
                                  }),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      defaultButton(context,isLoading:state is RegisterClientLoadingState, text:"تسجيل الدخول", onPressed: (){
                        if(RegisterValidation.currentState!.validate())
                        {
                          cubit.registerClient();
                        }

                      }, widthButton: 100.w,fontSize: 12.sp,heightButton: 6.h, borderRadius: 10, colorButton: ColorManager.primaryColor),
                      Padding (
                        padding:  EdgeInsets.all(1.h),
                        child: RichText(text: TextSpan(
                          text:  'هل لديك حساب بالفعل؟ ',
                          style: TextStyle(color: Colors.black,fontSize:10.sp,fontFamily: fontFamily),
                          children:  <TextSpan>[
                            TextSpan(text: "أضغط هنا  ", style: TextStyle(color:ColorManager.primaryColor,fontSize:10.sp,fontFamily: fontFamily),
                              recognizer:TapGestureRecognizer()..onTap = () {
                                navigateAndFinish(context, layout: LoginScreen());
                              },)
                          ],
                        ),),
                      )



                    ],),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
