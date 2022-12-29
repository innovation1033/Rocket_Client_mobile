import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../../../business_logic/home_cubit/home_cubit.dart';
import '../../../../business_logic/home_cubit/home_state.dart';
import '../../../../resource/values_manager.dart';

class ShipmentTapView extends StatelessWidget {
  final String image;

  final String text;

  final Function onTap;

  Color imageColor;

  final Color color;

   ShipmentTapView(
      {Key? key,
      required this.imageColor,
      required this.image,
      required this.text,
      required this.onTap,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            Container(
              height: 11.h,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(
                image,
                color: imageColor,
              ),
            ),
            SizedBox(
              height: AppSize.s4,
            ),
            Text(
              text,
              style: const TextStyle(color: Colors.black, fontSize: 14),
            ),
          ],
        );
      },
    );
  }
}
