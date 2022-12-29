import 'package:client_rocket/business_logic/home_cubit/home_cubit.dart';
import 'package:client_rocket/business_logic/home_cubit/home_state.dart';
import 'package:client_rocket/presentation/home_layot/shipments_screens/shipments_received_widget.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../resource/colors_manager.dart';
import '../../../resource/images_manager.dart';
import '../../shared_widget/custom_appbar.dart';
import 'current_shipments_widget.dart';

class ShipmentsScreen extends StatefulWidget {
  @override
  State<ShipmentsScreen> createState() => _ShipmentsScreenState();
}

class _ShipmentsScreenState extends State<ShipmentsScreen> {
  bool divider = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit=HomeCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: customAppBar(
              context,
              title: 'شحناتي'
          ),
          body: SingleChildScrollView(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                divider = true;
                              });
                            },
                            child: const Text(
                              'الشحنات الحالية',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            )),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Expanded(
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                divider = false;
                              });
                            },
                            child: const Text(
                              'الشحنات المستملة',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            )),
                      ),
                    ],
                  ),
                  divider == true
                      ? Divider(
                    color: ColorManager.primaryColor,
                    indent: 0.w,
                    thickness: 2.5,
                    endIndent: 50.w,
                  )
                      : Divider(
                    color: ColorManager.primaryColor,
                    indent: 50.w,
                    thickness: 2.5,
                    endIndent: 0.w,
                  ),
                  ConditionalBuilder(
                      condition: cubit.outOfDeliveryShipments!=null&&cubit.rceivedShipments!=null,
                      builder: (context) =>    ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return  divider == true
                                ? CurrentShipmentsWidget(
                              numberOfStatus: cubit.outOfDeliveryShipments!.shipment![index].shipmentStatusId,
                              OrderNumber: cubit.outOfDeliveryShipments!.shipment![index].id,
                              totalPrice: cubit.outOfDeliveryShipments!.shipment![index].totalShipment,
                              shipmentName: cubit.outOfDeliveryShipments!.shipment![index].nameShipment,
                              shipmentDescription: cubit.outOfDeliveryShipments!.shipment![index].description,
                              isBreakable: cubit.outOfDeliveryShipments!.shipment![index].breakable,
                              startMap: cubit.outOfDeliveryShipments!.shipment![index].startMap,
                              distnationMap: cubit.outOfDeliveryShipments!.shipment![index].endMap,
                              representativeID: cubit.outOfDeliveryShipments!.shipment![index].representative!.isNotEmpty?cubit.outOfDeliveryShipments!.shipment![index].representative![0].id:null,
                              Map: cubit.outOfDeliveryShipments!.shipment![index].map,
                            )
                                : ShipmentsReceivedWidget(numberOfStatus: cubit.rceivedShipments!.shipment![index].shipmentStatusId,OrderNumber: cubit.rceivedShipments!.shipment![index].id,totalPrice: cubit.rceivedShipments!.shipment![index].totalShipment,
                                shipmentName: cubit.rceivedShipments!.shipment![index].nameShipment,shipmentDescription: cubit.rceivedShipments!.shipment![index].description,isBreakable: cubit.rceivedShipments!.shipment![index].breakable,nameStatus:cubit.rceivedShipments!.shipment![index].nameShipmentStatu);
                          }, itemCount: divider == true? cubit.outOfDeliveryShipments!.shipment!.length:cubit.rceivedShipments!.shipment!.length),
                      fallback:  (context) => Center(child: CircularProgressIndicator()),)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}
