import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../business_logic/home_cubit/home_cubit.dart';
import '../../../../business_logic/home_cubit/home_state.dart';
import '../../../../resource/colors_manager.dart';
import '../../../shared_widget/custom_button_widget.dart';
import '../../../shared_widget/custom_dropdownbutton_widget.dart';

class ShipmentWayWidget extends StatefulWidget {
  ShipmentWayWidget(
      {Key? key,
      required this.onChange,
      required this.itemList1,
      required this.initialValue2,
      required this.initialValue1,
      required this.itemList2})
      : super(key: key);

  Function onChange;

  String initialValue1;
  String initialValue2;
  List<String> itemList1;
  List<String> itemList2;

  @override
  State<ShipmentWayWidget> createState() => _ShipmentWayWidgetState();
}

class _ShipmentWayWidgetState extends State<ShipmentWayWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Padding(
          padding:  EdgeInsets.all(1.h),
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
          /*    CustomDropDownButton(
                hintText: '',
                initialValue: widget.initialValue1,
                itemList: widget.itemList1,
                onChange: (value) {
                  setState(() {
                    widget.initialValue1 = value;
                  });
                },
              ),*/
              CustomDropDownButton(hint: 'أختر المحافظة',itemList:[],textValidation:  'أختر المحافظة',
                  onChanged:(value) {

                  }),

              SizedBox(
                height: 3.h,
              ),
            /*  CustomDropDownButton(
                hintText: '',
                initialValue: widget.initialValue2,
                itemList: widget.itemList2,
                onChange: (value) {
                  setState(() {
                    widget.initialValue2 = value;
                  });
                },
              ),*/
              CustomDropDownButton(hint: 'أختر المحافظة',itemList:[],textValidation:  'أختر المحافظة',
                  onChanged:(value) {

                  }),
              SizedBox(
                height: 3.h,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: CustomButton(
                  function: () {
                    widget.onChange();
                    /*if (widget.initialValue1 == 'أختر المحافظة' ||
                        widget.initialValue2 == 'أختر المنطقة') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("برجاء ادخال باقي البيانات"),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else {
                        widget.onChange();}*/
                  },
                  text: 'التالي',
                  color: ColorManager.primaryColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
