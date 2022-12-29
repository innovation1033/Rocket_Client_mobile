import 'package:client_rocket/business_logic/home_cubit/home_cubit.dart';
import 'package:client_rocket/business_logic/home_cubit/home_state.dart';
import 'package:client_rocket/presentation/shared_widget/widget_latest_offers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../resource/colors_manager.dart';
import '../../../resource/images_manager.dart';
import '../../shared_widget/custom_appbar.dart';
import '../../shared_widget/custom_button_widget.dart';

class LatestOffers extends StatelessWidget {
  const LatestOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit=HomeCubit.get(context);
        return Scaffold(
          appBar: customAppBar(
              context,
              title: 'أحدث العروض'
          ),
          body: ListView.separated(
              itemBuilder: (context, index) =>  BuildWidgetLatestOffersItem(cubit.offersModel!.offer![index]),
              separatorBuilder: (context, index) =>
                  Center(
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(start: 5.0, end: 5.0),
                      child: Container(
                        width: double.infinity,
                        height: 2,
                        color: ColorManager.yellowColor,
                      ),
                    ),
                  ),
              itemCount: cubit.offersModel!.offer!.length),

        );
      },
    );
  }
}
