import 'package:flutter/material.dart';
import '../presentation/home_layot/calculate_shipment_screens/calculate _shipment.dart.dart';
import '../presentation/home_layot/calculate_shipment_screens/complete _order.dart';
import '../presentation/home_layot/calculate_shipment_screens/finish_order_screen.dart';
import '../presentation/home_layot/calculate_shipment_screens/shipment_from_screens.dart';
import '../presentation/home_layot/calculate_shipment_screens/shipment_to_screen.dart';
import '../presentation/home_layot/home_layout.dart';
import '../presentation/home_layot/latest_offers_screens/latest_offers.dart';
import '../presentation/presentation_screens/on_boarding_screen.dart';
import '../presentation/presentation_screens/splash_screen.dart';
import '../presentation/registration_screens/create_screen.dart';
import '../presentation/registration_screens/login_screens/login_screen.dart';
import '../presentation/registration_screens/register_screens/otp_screen.dart';
import '../presentation/registration_screens/register_screens/register_screen.dart';
import '../presentation/registration_screens/reset_password_screens/otp_message.dart';
import '../presentation/registration_screens/reset_password_screens/new_password.dart';
import '../presentation/registration_screens/reset_password_screens/phone.dart';


class Routes {
  static const String splashScreen = '/';
  static const String onBoardingScreen = '/onBoardingRoute';
  static const String createScreen = '/createScreen';

  static const String loginScreen = '/loginScreen';
  static const String registerScreenByPhone = '/registerScreenByPhone';
  static const String otpScreen = '/otpScreen';


  static const String resetPasswordScreenByPhone = '/resetPasswordScreenByPhone';
  static const String messageScreenToForgetPassword = '/messageScreenToForgetPassword';
  static const String restNewPassword = '/restNewPassword';
  static const String completeOrderScreen = '/completeOrderScreen';

  static const String homeScreenLayout = '/homeScreenLayout';

  static const String latestOffersScreens = '/latestOffersScreens';
  static const String finishOrderScreen = '/finishOrderScreen';

  static const String shipmentFromScreen = '/shipmentFromScreen';
  static const String shipmentToScreen = '/shipmentToScreen';

  static const String calculateShipmentScreen = '/calculateShipmentScreen';



}

class RouteGenerator {
  static Route<dynamic>? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());

      case Routes.createScreen:
        return MaterialPageRoute(builder: (_) => CreateScreen());

      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case Routes.registerScreenByPhone:
        return MaterialPageRoute(builder: (_) => RegisterScreen());

      case Routes.otpScreen:
        final Object ?   phoneNumber = settings.arguments;
        return MaterialPageRoute(builder: (_) => OtpScreen(phone:phoneNumber)  ) ;

      case Routes.resetPasswordScreenByPhone:
        return MaterialPageRoute(builder: (_) => ResetPasswordByPhone()  ) ;

      case Routes.messageScreenToForgetPassword:
        final Object ?   phoneNumber = settings.arguments;
        return MaterialPageRoute(builder: (_) => MessageScreenToForgetPassword(phone:phoneNumber)  ) ;

      case Routes.restNewPassword:
        return MaterialPageRoute(builder: (_) => RestNewPassword()  ) ;

      case Routes.homeScreenLayout:
        return MaterialPageRoute(builder: (_) => HomeLayoutScreen()  ) ;

      case Routes.latestOffersScreens:
        return MaterialPageRoute(builder: (_) => LatestOffers()  ) ;

      case Routes.completeOrderScreen:
        return MaterialPageRoute(builder: (_) => CompleteOrder()  ) ;

      case Routes.finishOrderScreen:
        return MaterialPageRoute(builder: (_) => FinishOrderScreen()  ) ;

      case Routes.shipmentFromScreen:
        return MaterialPageRoute(builder: (_) => ShipmentFrom()  ) ;

      case Routes.shipmentToScreen:
        return MaterialPageRoute(builder: (_) => ShipmentToScreen()  ) ;
      case Routes.calculateShipmentScreen:
        return MaterialPageRoute(builder: (_) => CalculateShipment()  ) ;


    }
  }
}
