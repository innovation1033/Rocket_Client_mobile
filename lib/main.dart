
import 'package:client_rocket/business_logic/cubit_registeration/registeration_cubit_class.dart';
import 'package:client_rocket/helper_methods/dio_helper/dio.dart';
import 'package:client_rocket/presentation/home_layot/calculate_shipment_screens/calculate%20_shipment.dart.dart';
import 'package:client_rocket/business_logic/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:client_rocket/presentation/home_layot/profile_screens/map/map_cubit.dart';
import 'package:client_rocket/resource/constants_manager.dart';
import 'package:client_rocket/resource/routes_manager.dart';
import 'package:client_rocket/resource/theme_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'business_logic/home_cubit/home_cubit.dart';
import 'helper_methods/sharedpref/shared_preference.dart';
import 'presentation/home_layot/calculate_shipment_screens/cubit_caluclate_shipment/caluclate_shipment_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  DioHelper.init();
  await SharedCashHelper.init();
  token=SharedCashHelper.getValue(key: "accessToken");
  runApp( const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider<MapCubit>(create: (context)=>MapCubit()..setCustomMarkerIcon()),
          BlocProvider<RegisterationCubitClass>(
            create: (BuildContext context) => RegisterationCubitClass()..getCountaries(),
          ),
          BlocProvider<EditProfileCubit>(
            create: (BuildContext context) => EditProfileCubit()..getUserProfile()..getCountaries(),
          ),
          BlocProvider<HomeCubit>(
            create: (BuildContext context) => HomeCubit()..getClientOutOfDeliveryShipments(context)..getclientRceivedShipments()..getAllBranch(),
          ),
          BlocProvider<CaluclateShipmentCubit>(
            create: (BuildContext context) => CaluclateShipmentCubit()..getCountariesMove()..getCountariesArrived()..getCars()..getPrice(),
          ),
        ],
        child: MaterialApp(
          theme: lightTheme,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.splashScreen,
        ),
      );
    });
  }
}
