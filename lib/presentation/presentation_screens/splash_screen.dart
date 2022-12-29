import 'dart:async';
import 'dart:developer';

import 'package:client_rocket/helper_methods/functions_needed/functions.dart';
import 'package:client_rocket/helper_methods/sharedpref/shared_preference.dart';
import 'package:client_rocket/presentation/home_layot/calculate_shipment_screens/calculate%20_shipment.dart.dart';
import 'package:client_rocket/presentation/home_layot/calculate_shipment_screens/finish_order_screen.dart';
import 'package:client_rocket/presentation/home_layot/home_layout.dart';
import 'package:client_rocket/presentation/registration_screens/create_screen.dart';
import 'package:client_rocket/presentation/registration_screens/login_screens/login_screen.dart';
import 'package:flutter/material.dart';
import '../../resource/colors_manager.dart';
import '../../resource/constants_manager.dart';
import '../../resource/images_manager.dart';
import '../../resource/routes_manager.dart';
import '../home_layot/shipments_screens/current_shipments_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: splashDelay), _goNext);
  }

  _goNext() {
    if (SharedCashHelper.getValue(key: 'onBoarding') == true) {
      if( SharedCashHelper.getValue(key: "accessToken")!=null)
        {
          log("Token:${token}");
          navigateAndFinish(context, layout:HomeLayoutScreen());
        }
      else  navigateAndFinish(context, layout:CreateScreen());
    } else{
      Navigator.pushReplacementNamed(context, Routes.onBoardingScreen);
    }
  }

  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.myWhite,
      body: const Center(
        child: Image(
          image: AssetImage(ImageAssets.boltLogo),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
