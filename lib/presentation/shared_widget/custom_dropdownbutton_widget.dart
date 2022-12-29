import 'package:client_rocket/resource/colors_manager.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomDropDownButton extends StatelessWidget {
  final List itemList;
  void Function(dynamic)? onChanged;
  dynamic value;
  String?textValidation,hint;

  CustomDropDownButton({required this.itemList,required this.onChanged,required this.hint,required this.textValidation,this.value});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<dynamic>(
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.primaryColor,width: .2.h),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.primaryColor,width: .2.h),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red,width: .2.h),
          borderRadius: BorderRadius.circular(10),
        ),
        iconColor: ColorManager.primaryColor,

      ),
      isExpanded: true,
      hint:  Text(
        '$hint',
        style: TextStyle(fontSize: 14),
      ),
      icon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.black45,
      ),
      iconSize: 30,
      buttonHeight: 60,
      buttonPadding: const EdgeInsets.only(left: 20, right: 10),
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      value:value,
      items: itemList
          .map((item) =>
          DropdownMenuItem<dynamic>(
            value: item,
            child: Text(
              item.name,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ))
          .toList(),
         validator: (value) {
        if (value == null) {
          return '$textValidation';
        }
      },
      onChanged: onChanged,
      onSaved: (value) {
      },
    );
  }
}