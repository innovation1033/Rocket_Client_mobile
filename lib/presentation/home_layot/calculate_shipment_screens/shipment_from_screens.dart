import 'package:client_rocket/presentation/home_layot/calculate_shipment_screens/widgets_calculate_shipment_screens/shipment_way_widget.dart';
import 'package:client_rocket/presentation/home_layot/calculate_shipment_screens/widgets_calculate_shipment_screens/widget_shipment_tabview.dart';
import 'package:client_rocket/resource/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../resource/colors_manager.dart';
import '../../../resource/images_manager.dart';
import '../../shared_widget/custom_appbar.dart';
import 'lists_calculate_shipments_screen.dart';

class ShipmentFrom extends StatelessWidget {
  String initialValueGovernorateForm = 'أختر المحافظة';
  String initialValueRegionForm = 'أختر المنطقة';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        title: 'أحسب شحنتك',
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: ColorManager.myWhite,
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShipmentTapView(
                      onTap: () {

                      },
                      color:Color(0xffDAD9DE) ,

                      image: ImageAssets.shipmentsScreenLogo1,
                      text: 'نوع الشحنة',
                      imageColor: Colors.black,

                    ),
                    ShipmentTapView(
                      onTap: () {

                      },

                      color: Color(0xffe0a827),
                      imageColor: Colors.white,

                      image: ImageAssets.shipmentsScreenLogo2,
                      text: 'الشحنة من',
                    ),
                    ShipmentTapView(
                      onTap: () {},
                      color: Color(0xffDAD9DE),
                      imageColor: Colors.black,

                      image: ImageAssets.shipmentsScreenLogo3,
                      text: 'الشحنة الي',
                    ),
                  ],
                ),
              ),
              ShipmentWayWidget(
                initialValue1: initialValueGovernorateForm,
                initialValue2: initialValueRegionForm,
                itemList1: itemValuesGovernorate,
                itemList2: itemValuesRegion,
                onChange: () {
                  Navigator.pushNamed(context, Routes.shipmentToScreen) ;
                },
              ),
            ],
          ),
        ),
      ),
    ) ;
  }
}
