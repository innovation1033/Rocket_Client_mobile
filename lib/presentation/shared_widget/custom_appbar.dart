

import 'package:client_rocket/helper_methods/functions_needed/functions.dart';
import 'package:client_rocket/presentation/registration_screens/login_screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../resource/colors_manager.dart';
import '../../resource/images_manager.dart';

PreferredSizeWidget customAppBar(context,{required title})
{
  return AppBar(
    backgroundColor: ColorManager.myWhite,
    centerTitle: true,
    elevation: 2,
    /*leading: GestureDetector(
      onTap: () {

      },
      child: SvgPicture.asset(
        ImageAssets.notificationsLogoInAppBar,
      ),
    ),*/
    title:  Text(
      title,
      style:  TextStyle(
        color: Colors.black,
        fontSize: 15.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
