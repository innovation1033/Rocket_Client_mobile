

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:client_rocket/business_logic/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:client_rocket/business_logic/models/all_branches.dart';
import 'package:client_rocket/business_logic/models/client_shipments.dart';
import 'package:client_rocket/business_logic/models/offer_model.dart';
import 'package:client_rocket/helper_methods/dio_helper/dio.dart';
import 'package:client_rocket/helper_methods/functions_needed/functions.dart';
import 'package:client_rocket/presentation/home_layot/profile_screens/profile_screen.dart';
import 'package:client_rocket/presentation/registration_screens/login_screens/login_screen.dart';
import 'package:client_rocket/resource/constants_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../helper_methods/sharedpref/shared_preference.dart';
import '../../presentation/home_layot/calculate_shipment_screens/calculate _shipment.dart.dart';
import '../../presentation/home_layot/latest_offers_screens/latest_offers.dart';
import '../../presentation/home_layot/our_branches_screens/our_branches.dart';
import '../../presentation/home_layot/shipments_screens/shipments_screen.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

 static HomeCubit get(context)=>BlocProvider.of(context) ;

  //TODO handle BottomNavigationBarScreen
  int currentIndex = 0;
  List<Widget> bottomScreen = [
    ShipmentsScreen(),
    CalculateShipment(),
    OurBranches(),
    ProfileScreen() ,
    //LatestOffers() ,
  ];

  //ToDo handle ShipmentsScreen
  int index  = 1;
  void changeBottom(int index,context) {
    currentIndex = index;
    if(index==0)
      {
        getClientOutOfDeliveryShipments(context);
        getclientRceivedShipments();
      }
    if(index==2)
    {
     getAllBranch();
    }
    if(index==3)
    {
      EditProfileCubit.get(context).getUserProfile();
    }
    emit(HomeBottomNavState());
  }

  ClientShipments? outOfDeliveryShipments,rceivedShipments;
 void getClientOutOfDeliveryShipments(context)
     {
   DioHelper.getData(
     authorization:  "Bearer ${token}",
     url: "api/mobile/clientOutOfDelivery",
   ).then((value) {
     print('B1>>>>>>>>clientOutOfDelivery>>>>>>>>>${value.data}');
       outOfDeliveryShipments=ClientShipments.fromJson(value.data);
       print("3dQQ!!>>${outOfDeliveryShipments!.shipment!.length}");
        emit(ClientOutOfDeliverySucess());
   } ).catchError((erorr){
     if(erorr.response.data["status"] ==  "Token is Expired"||erorr.response.data["errors"]["status"] ==  "not active")
     {
       log("aaaa!!${erorr.toString()}");
       navigateAndFinshScreen(context, LoginScreen());
       SharedCashHelper.removeValue(key: "accessToken");
     }
     emit(ClientOutOfDeliveryErorr());
   });
 }
  void getclientRceivedShipments()
     {
    DioHelper.getData(
      authorization:  "Bearer ${token}",
      url: "api/mobile/clientGetShipment",
    ).then((value) {
      print('B2>>>>>>>>clientGetShipment>>>>>>>>>${value.data}');
      rceivedShipments=ClientShipments.fromJson(value.data);
      emit(ClientRecivedSucess());
    } ).catchError((){
      emit(ClientRecivedErorr());
    });
  }

  OffersModel? offersModel;
  getOffers()
  {
    DioHelper.getData(
      authorization:  "Bearer ${token}",
      url: "api/mobile/all-offer",
    ).then((value) {
      print('B6>>>>>>>>all-offer>>>>>>>>>${value.data}');
      offersModel=OffersModel.fromJson(value.data);
      emit(getAllOfferSucessState());
    } ).catchError((){
      emit(getAllOfferErorrState());
    });
  }
  AllBranches? allBranches;
  void getAllBranch()
  {
    DioHelper.getData(
      authorization:  "Bearer ${token}",
      url: "api/mobile/allBranch",
    ).then((value) {
      print('B2>>>>>>>>allBranch>>>>>>>>>${value.data}');
      allBranches=AllBranches.fromJson(value.data);
      emit(getAllBranchSucessState());
    } ).catchError((){
      emit(getAllBranchErorrState());
    });
  }


}
