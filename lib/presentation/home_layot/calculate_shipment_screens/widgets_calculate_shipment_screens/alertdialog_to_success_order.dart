import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../resource/colors_manager.dart';
import '../../../../resource/images_manager.dart';
import '../../../../resource/routes_manager.dart';

class AlertDialogToSuccessOrder extends StatelessWidget {
  const AlertDialogToSuccessOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0.0,
      backgroundColor: Colors.white.withOpacity(0),
      content: Stack(
        alignment: Alignment.topCenter,
        children: [
          Center(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(15),
                  color: ColorManager.primaryColor,
                ),
                padding: const EdgeInsets.all(10),
                height: 45.h,
                child: Center(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      const Text(
                        '''تم أرسال طلبك بنجاح سيتم التواصل معاك
من خلال فريق خدمة العملاء                                                                   ''',
                        style: const TextStyle(
                          fontFamily: 'hanimation',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        maxLines: 3,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        width: 50.w,
                        decoration: BoxDecoration(
                          color: ColorManager.myWhite,
                          borderRadius:
                          BorderRadius.circular(
                              8),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator
                                .pushReplacementNamed(
                                context,
                                Routes
                                    .latestOffersScreens);
                          },
                          child: Text(
                            'أحدث العروض',
                            style: TextStyle(
                                fontFamily:
                                'hanimation',
                                color: ColorManager
                                    .primaryColor,
                                fontSize: 20,
                                fontWeight:
                                FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 10.h,
            ),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 46,
                backgroundColor:
                ColorManager.primaryColor,
                child: SvgPicture.asset(
                  ImageAssets.orderPopup,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 9.h,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                      color: Colors.white, width: 5),
                  borderRadius:
                  BorderRadius.circular(250),
                ),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    iconSize: 30,
                    color: Colors.white,
                    icon: const Icon(Icons.close)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
