import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:client_rocket/helper_methods/functions_needed/functions.dart';
import 'package:client_rocket/business_logic/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:client_rocket/helper_methods/sharedpref/shared_preference.dart';
import 'package:client_rocket/presentation/registration_screens/login_screens/login_screen.dart';
import 'package:client_rocket/presentation/shared_widget/custom_appbar.dart';
import 'package:client_rocket/presentation/shared_widget/custom_button.dart';
import 'package:client_rocket/presentation/shared_widget/custom_dropdownbutton_widget.dart';
import 'package:client_rocket/presentation/shared_widget/custom_textFormField_widget.dart';
import 'package:client_rocket/resource/colors_manager.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var formKeyDropDown = GlobalKey<FormState>();
    var formKeyProfileScreen = GlobalKey<FormState>();

    return Scaffold(
      appBar: customAppBar(
          context,
          title: 'تعديل الحساب'),
      body:  BlocBuilder<EditProfileCubit,EditProfileState>(
       builder: (context, state) {
         var cubit=EditProfileCubit.get(context);
        return ConditionalBuilder(
          builder: (context) => Directionality(
              textDirection: TextDirection.rtl,
              child: Form(
                key: formKeyProfileScreen,
                child: SingleChildScrollView(
                  child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              margin:  EdgeInsets.only(bottom: 7.h),
                              height: 20.h,
                              width: double.infinity,
                              child: Image.network(
                                "https://png.pngtree.com/thumb_back/fh260/back_our/20190622/ourmid/pngtree-g20-summit-simple-business-background-image_232743.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Stack(
                              alignment: AlignmentDirectional.bottomStart,
                              children: [
                                CircleAvatar(
                                  radius: 7.h,
                                  backgroundImage: cubit.image!=null?Image.file(cubit.image!).image:NetworkImage("${cubit.userProfileModel!.userData!.imagePath!=null?cubit.userProfileModel!.userData!.imagePath:"https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_1280.png"}",),),
                                GestureDetector(
                                  onTap: () async {
                                    await cubit.getImageGallery();
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: ColorManager.yellowColor,
                                    radius: 2.h,
                                    child: const Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding:  EdgeInsets.all(1.h),
                          child: Column(
                            children: [
                              defaultFormField(
                                controller:cubit.clientIDController,
                                textAlign: TextAlign.center,
                                keyboardtype:  TextInputType.text,
                                isClickable: false,
                                suffixicon: starSuffixIcon(),
                                labelText:"كود العميل",
                              ),
                              SizedBox(height: 1.5.h),
                              defaultFormField(
                                controller:cubit.updateUserNameController,
                                suffixicon: starSuffixIcon(),
                                keyboardtype:  TextInputType.text,
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
                                controller:cubit.updateNameController,
                                keyboardtype:  TextInputType.text,
                                suffixicon: starSuffixIcon(),
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
                                controller:cubit.updatePhoneController,
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
                                controller:cubit.updateEmailController,
                                keyboardtype:  TextInputType.emailAddress,
                                labelText:"الايميل",

                              ),
                              SizedBox(height: 2.h),
                              Row(
                                children: [
                                  Expanded(
                                    child:CustomDropDownButton(hint: 'أختر المحافظة',itemList:cubit.allCountries,textValidation:  'أختر المحافظة',
                                        onChanged:(value) {
                                          cubit.onCountryChange(value);
                                          formKeyDropDown.currentState!.reset();

                                        }),
                                  ),
                                  SizedBox(width: 2.h,),
                                  Expanded(
                                    child:Form(
                                      // key: formDropDown,
                                      child: Form(
                                        key: formKeyDropDown,
                                        child: CustomDropDownButton(hint: 'أختر المنطقة',itemList:cubit.allCitiess,textValidation:  'أختر المحافظة',
                                            onChanged: (value) {
                                              cubit.cityId=value.id;
                                            }),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.h),
                              defaultButton(context, text:"حفظ التعديلات",isLoading:state is UserProfileLoadingState, onPressed: (){
                               if(formKeyProfileScreen.currentState!.validate())
                                 {
                                   cubit.updateCompanyProfile(context);
                                 }

                              }, widthButton: 100.w,fontSize: 12.sp,heightButton: 6.h, borderRadius: 10, colorButton: ColorManager.primaryColor),
                              SizedBox(height: 1.h),
                              defaultButton(context, text:"تسجيل الخروج", onPressed: (){
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.question,
                                  animType: AnimType.rightSlide,
                                  title: 'هل تريد الذهاب تسجيل الخروج؟',
                                  btnCancelText: "إلغاء",
                                  btnOkText: "قبول",
                                  reverseBtnOrder: true,
                                  btnOkOnPress: (){
                                    SharedCashHelper.removeValue(key: "accessToken").then((value) => navigateAndFinish(context, layout: LoginScreen()));
                                  },
                                  btnCancelOnPress: (){

                                  },
                                  padding: EdgeInsets.all(2.h),


                                ).show();

                              }, widthButton: 100.w,fontSize: 12.sp,heightButton: 6.h, borderRadius: 10, colorButton: Colors.red),
                            ],
                          ),
                        ),
                      ]),
                ),
              )
          ),
          fallback:  (context) => Center(child: CircularProgressIndicator()),
          condition: cubit.userProfileModel!=null,
        );
  },
));
          }
        }
