import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../resource/colors_manager.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputType keyBoardType;
  final String text;
  final bool isPassword ;
  String? Function(String? val) validator ;
  final TextEditingController textEditingController;
  Widget ? suffixIcon  ;
  IconData  ? prefixIcon   ;
  CustomTextFormField(
      {Key? key,
      required this.isPassword ,
      this.suffixIcon ,
      required this.validator,
      required this.textEditingController,
      required this.text,
      this.prefixIcon ,
      required this.keyBoardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding:  EdgeInsets.all(.5.h),
        child: TextFormField(
            keyboardType: keyBoardType,
            obscureText: isPassword,
            controller: textEditingController,
            style: const TextStyle(fontSize: 15, fontFamily: "hanimation"),
            cursorColor: ColorManager.primaryColor,
            decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(10.0)),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
                fillColor: Colors.white,
                suffixIcon: suffixIcon ,
                prefixIconColor: ColorManager.primaryColor,
                filled: true,
                prefixIcon: Icon(
                  prefixIcon,
            ),
                enabledBorder:  const OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(10.0)),
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:  const BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                    color: ColorManager.primaryColor,
                  ),
                ),
                disabledBorder:  const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
                hintText: text,




            ),
          validator: (value) {
            return validator(value);
          },
            ),
      ),
    );
  }
}

class CustomTextFormFieldWithExpanded extends StatelessWidget {
  final TextInputType keyBoardType;
  final String text;
  final bool isPassword ;
  String? Function(String? val) validator ;
  final TextEditingController textEditingController;
  Widget ? suffixIcon  ;
  IconData  ? prefixIcon   ;
  CustomTextFormFieldWithExpanded(
      {Key? key,
        required this.isPassword ,
        this.suffixIcon ,
        required this.validator,
        required this.textEditingController,
        required this.text,
        this.prefixIcon ,
        required this.keyBoardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Expanded(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal:1.h,vertical: .5.h),
          child: TextFormField(
            keyboardType: keyBoardType,
            obscureText: isPassword,
            controller: textEditingController,
            style: const TextStyle(fontSize: 15, fontFamily: "hanimation"),
            cursorColor: ColorManager.primaryColor,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(const Radius.circular(10.0)),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              fillColor: Colors.white,
              suffixIcon: suffixIcon ,
              prefixIconColor: ColorManager.primaryColor,
              filled: true,

              enabledBorder:  const OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(const Radius.circular(10.0)),
                borderSide: BorderSide(
                  color: Colors.red,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius:  const BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(
                  color: ColorManager.primaryColor,
                ),
              ),
              disabledBorder:  const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              hintText: text ,

            ),
            validator: (value) {
              return validator(value);
            },
          ),
        ),
      ),
    );
  }
}

Widget starSuffixIcon() {
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: SvgPicture.asset(
      "Assets/images/noun-required-1371268.svg",
      color: ColorManager.yellowColor,
      width:10.0,
      height: 10.0,
    ),
  );
}

Widget defaultFormField(
    {
      required TextEditingController controller,
      required TextInputType keyboardtype,
      Widget? suffixicon,
      IconData? prefixIcon,
      Function()? onTap,
      bool obscuretext = false,
      bool isPrefixIcon = false,
      bool isClickable = true,
      required String  labelText,
      String? Function(String?)?  validator,
      Function(String)?  submitt,
      int maxLines=1,
      double contentPaddingStart=1.5,
      double contentPaddingEnd=1.5,
      double contentPaddingTop=1.5,
      double contentPaddingDown=1.5,
      TextStyle? labelStyle,

      TextAlign textAlign=TextAlign.start,

    }) {
  return TextFormField(
    onFieldSubmitted: submitt,
    enabled: isClickable,
    onTap: onTap,
    maxLines: maxLines,
    controller: controller,
    keyboardType: keyboardtype,
    validator: validator,
    textAlign: textAlign,
    obscureText: obscuretext,
    decoration: InputDecoration(
      isDense: true, // important line
      contentPadding: EdgeInsetsDirectional.fromSTEB(contentPaddingStart.h,contentPaddingTop.h, contentPaddingEnd.h,contentPaddingDown.h,),
      hintText: labelText,
      labelText: labelText,
        labelStyle: TextStyle(fontSize: 10.sp),
      hintStyle: TextStyle(color: ColorManager.primaryColor),
      enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(.8.h)),
          borderSide: BorderSide(color: ColorManager.primaryColor,width  : .4.w)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(.8.h)),
          borderSide: BorderSide(color: ColorManager.primaryColor,width: .4.w)),
      errorBorder:OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(.8.h)),
          borderSide: BorderSide(color: Colors.red,width: .4.w)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(.8.h)),
          borderSide: BorderSide(color: ColorManager.primaryColor,width: .4.w)),
      suffixIcon: suffixicon != null ? suffixicon : null,
      prefixIcon:isPrefixIcon?Icon(
        prefixIcon,
        color: ColorManager.primaryColor,
        size: 2.5.h,
      ):null,
    ),
  );
}
