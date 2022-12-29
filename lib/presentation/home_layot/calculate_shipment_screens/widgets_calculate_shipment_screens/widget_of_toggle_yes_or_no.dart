import 'package:flutter/material.dart';

import '../../../../resource/colors_manager.dart';

class ToggleToYesOrNo extends StatefulWidget {
   ToggleToYesOrNo(
      {Key? key,
      required this.text,
      required this.radioGroup})
      : super(key: key);


  String text;
  int radioGroup;

  @override
  State<ToggleToYesOrNo> createState() => _ToggleToYesOrNoState();
}

class _ToggleToYesOrNoState extends State<ToggleToYesOrNo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'نعم',
          style: TextStyle(fontSize: 20),
        ),
        Radio(
          value: 1,
          groupValue: widget.radioGroup,
          activeColor: ColorManager.primaryColor,
          onChanged: (int? value){
            setState(() {
              widget.radioGroup = value! ;
            });
          },
        ),
        Text('لا', style: TextStyle(fontSize: 20)),
        Radio(
          value: 2,
          groupValue: widget.radioGroup,
          activeColor: ColorManager.primaryColor,
          onChanged: (int? value){
            setState(() {
              widget.radioGroup = value! ;
            });
          },
        ),
        Spacer(),
        Text(
          widget.text,
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'hanimation',
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
        ),
      ],
    );
  }
}
