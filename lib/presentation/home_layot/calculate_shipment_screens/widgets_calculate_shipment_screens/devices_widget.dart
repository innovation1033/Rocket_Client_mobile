import 'package:client_rocket/resource/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../business_logic/home_cubit/home_cubit.dart';
import '../../../../business_logic/home_cubit/home_state.dart';
import '../../../../resource/colors_manager.dart';
import '../../../shared_widget/custom_button_widget.dart';
import '../../../shared_widget/custom_dropdownbutton_widget.dart';
import '../lists_calculate_shipments_screen.dart';

class DeviceWidget extends StatefulWidget {

  @override
  State<DeviceWidget> createState() => _DeviceWidgetState();

  Function onChange ;
  DeviceWidget({required this.onChange}) ;

}

class _DeviceWidgetState extends State<DeviceWidget> {
    String initialValueCategory = 'أختر فئة المنتج';

  String initialValueType = 'أختر نوع المنتج';


  @override
  Widget build(BuildContext context) {
    return BlocBuilder< HomeCubit , HomeState>(
      builder: (context, state) {
        return Column(
          children: [
           /* CustomDropDownButton(
              hintText: '',
              initialValue: initialValueCategory,
              itemList: itemValuesCategory,
              onChange: (value) {
                setState(() {
                  initialValueCategory = value;
                });
              },
            ),*/
            SizedBox(
              height: 3.h,
            ),
        /*    CustomDropDownButton(
              hintText: '',
              initialValue: initialValueType,
              itemList: itemValuesType,
              onChange: (value) {
                setState(() {
                  initialValueType = value;
                });
              },
            ),*/
            SizedBox(
              height: 3.h,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomButton(
                function: () {
                  if (initialValueCategory ==
                      'أختر فئة المنتج' ||
                      initialValueType ==
                          'أختر نوع المنتج') {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      SnackBar(
                        content: Text(
                            "برجاء ادخال باقي البيانات"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    Navigator.pushNamed(
                        context, Routes.shipmentFromScreen);
                  }
                },
                text: 'التالي',
                color: ColorManager.primaryColor,
              ),
            ),
          ],
        );
      },
    );
  }
}
