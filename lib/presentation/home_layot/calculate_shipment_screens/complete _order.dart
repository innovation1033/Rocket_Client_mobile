import 'package:client_rocket/presentation/home_layot/calculate_shipment_screens/widgets_calculate_shipment_screens/row_in_table_of_complete_data.dart';
import 'package:client_rocket/presentation/home_layot/calculate_shipment_screens/widgets_calculate_shipment_screens/shipment_details_screen.dart';
import 'package:client_rocket/presentation/home_layot/calculate_shipment_screens/widgets_calculate_shipment_screens/widget_shipment_tabview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../resource/colors_manager.dart';
import '../../../resource/images_manager.dart';
import '../../../resource/routes_manager.dart';
import '../../../resource/values_manager.dart';
import '../../shared_widget/custom_button_widget.dart';

class CompleteOrder extends StatefulWidget {
  @override
  State<CompleteOrder> createState() => _CompleteOrderState();
}

class _CompleteOrderState extends State<CompleteOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.myWhite,
        centerTitle: true,
        elevation: 0.0,
        actions: [
          InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              ImageAssets.notificationsLogoInAppBar,
            ),
          )
        ],
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text(
          'أتمام الطلب',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontFamily: 'hanimation',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: ColorManager.myWhite,
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ShipmentTapView(
                      image: ImageAssets.completeOrderScreen1,
                      text: 'الشحن خلال : 4 أيام',
                      imageColor: Colors.black,
                      onTap: () {},
                      color: Color(0xffDAD9DE),
                    ),
                    ShipmentTapView(
                      image: ImageAssets.completeOrderScreen2,
                      imageColor: Colors.black,
                      text: 'تكلفة الشحن : 500 جنية',
                      onTap: () {},
                      color: Color(0xffDAD9DE),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.grey[300],
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    ShipmentDetailsScreen(
                      text2: 'القاهرة',
                      text1: 'الشحنه من',
                      image: ImageAssets.locationImage,
                      onTap: () {
                        Navigator.pushNamed(context, Routes.shipmentFromScreen);
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    ShipmentDetailsScreen(
                      text2: 'اسوان',
                      text1: 'الشحنه الي',
                      image: ImageAssets.locationImage,
                      onTap: () {
                        Navigator.pushNamed(context, Routes.shipmentToScreen);
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    ShipmentDetailsScreen(
                      text2: 'اسوان',
                      text1: 'الشحنه الي',
                      image: ImageAssets.editImage,
                      onTap: () {
                        Navigator.pushNamed(context, Routes.shipmentToScreen);
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    const Text(
                      'تفاصيل الشحنة',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20),
                    ),
                    Container(
                      height: 8.h,
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'أسم المنتج',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            width: 18.w,
                          ),
                          Text(
                            'الكمية',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'الأجرأت ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RowInTableOfCompleteDataScreen(
                      text1: 'ثلاجة 10 قدم',
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.calculateShipmentScreen);
                      },
                      text2: '3',
                    ),
                    RowInTableOfCompleteDataScreen(
                      text1: 'ثلاجة 10 قدم',
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.calculateShipmentScreen);
                      },
                      text2: '3',
                    ),
                    RowInTableOfCompleteDataScreen(
                      text1: 'ثلاجة 10 قدم',
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.calculateShipmentScreen);
                      },
                      text2: '3',
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: CustomButton(
                        function: () {
                          Navigator.pushNamed(
                              context, Routes.finishOrderScreen);
                        },
                        text: 'استكمال البيانات',
                        color: ColorManager.primaryColor,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
