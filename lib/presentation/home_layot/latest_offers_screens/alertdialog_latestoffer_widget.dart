import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../resource/colors_manager.dart';
import '../../../resource/images_manager.dart';

class AlertDialogLatestOffer extends StatelessWidget {
  const AlertDialogLatestOffer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog (
      elevation: 0.0,
      backgroundColor: Colors.white.withOpacity(0),
      content: Stack(
        alignment: Alignment.topCenter,
        children: [
          Center(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                height: 35.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15) ,
                  color:ColorManager.primaryColor ,

                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'تم إرسال طلبك بنجاح',
                        style: TextStyle(
                          fontFamily: 'hanimation',
                          fontSize: 23 ,
                          fontWeight: FontWeight.bold,
                          color: Colors.white ,
                        ),
                      ) ,
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 20
                        ),
                        child: Text(
                          'سيتم التواصل معك من خلال احد أعضاء فريق مبيعات شركة bolt',
                          style: TextStyle(
                            fontFamily: 'hanimation',
                            fontSize: 16 ,
                            fontWeight: FontWeight.bold,
                            color: Colors.white ,
                          ),
                        ),
                      ) ,

                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding:EdgeInsets.only(
              top: 17.5.h ,
            ),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 46,
                backgroundColor: ColorManager.primaryColor ,
                child: SvgPicture.asset(ImageAssets.orderPopup ,
                  height: 70,
                  width: 70,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 13.5.h ,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.white, width: 5),
                  borderRadius: BorderRadius.circular(250),
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
    ) ;
  }
}
