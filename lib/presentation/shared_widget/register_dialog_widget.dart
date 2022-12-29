import 'package:client_rocket/resource/colors_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class RegisterAlertDialog extends StatelessWidget {
  String cardImgUrl;

  Widget content;

  RegisterAlertDialog({required this.cardImgUrl, required this.content});

  @override
  Widget build(BuildContext context) {

    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(

              width: 80.w,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top:4.5.h),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Card(
                        child: content,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 12.h,
                      width: 12.h,
                      child: Card(
                        color: ColorManager.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                            side: BorderSide(color: Colors.white, width: 5)),
                        child: Padding(
                          padding:  EdgeInsets.only(top: 1.5.h),
                          child: SvgPicture.asset(
                            cardImgUrl,
                            width: .5.h,
                            height:.5.h,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.cancel_outlined,
                size: 6.h,
                color: Colors.white,
              ),
            ),
          ],
        ));
  }
}