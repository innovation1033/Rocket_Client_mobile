import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:client_rocket/business_logic/models/area_model.dart';
import 'package:client_rocket/business_logic/models/car_model.dart';
import 'package:client_rocket/business_logic/models/countaries_and_cities.dart';
import 'package:client_rocket/business_logic/models/provinces_model.dart';
import 'package:client_rocket/helper_methods/dio_helper/dio.dart';
import 'package:client_rocket/helper_methods/sharedpref/shared_preference.dart';
import 'package:client_rocket/presentation/home_layot/calculate_shipment_screens/Models/item_product_model.dart';
import 'package:client_rocket/resource/constants_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'caluclate_shipment_state.dart';

class CaluclateShipmentCubit extends Cubit<CaluclateShipmentState> {
  CaluclateShipmentCubit() : super(CaluclateShipmentInitial());

  static CaluclateShipmentCubit get(context) => BlocProvider.of(context);

  var formAddProduct = GlobalKey<FormState>();
  var formKey = GlobalKey<FormState>();
  var formKeyDropDown1 = GlobalKey<FormState>();
  var formKeyDropDown2 = GlobalKey<FormState>();
  var formKeyDropDown3 = GlobalKey<FormState>();
  var heightController = TextEditingController();
  var widthController = TextEditingController();
  var longController = TextEditingController();
  var nameProductController = TextEditingController();
  var countController = TextEditingController();

  List itemProductList = [];
  List<Map<String, dynamic>> itemMapOfProductList=[];

  void addToProductList({required ItemProductModel itemProductModel}) {
    itemProductList.add(itemProductModel!);
    itemMapOfProductList.addAll([{'name_product':itemProductModel.nameProduct ,'height':itemProductModel.long,'width':itemProductModel.width ,'length':itemProductModel.height,'count':itemProductModel.count,}]);
    print("addToProductList###########${itemMapOfProductList[0]}");
    emit(SuccessAddToProductList());
  }
  num remainingWeight=0;
   getRemainingWeight() {
    num totalWeight=0;
    for(int i=0;i<itemProductList.length;i++)
    {
      totalWeight+=itemProductList[i].weight;
    }
   remainingWeight= carWeight-totalWeight;
    emit(getRemainingState());
    return remainingWeight;

  }

  void deleteProductFromList(index) {
    itemProductList.removeAt(index);
    itemMapOfProductList.removeAt(index);
    print("deleteProductFromList###########${itemMapOfProductList.toString()}");

    emit(SuccessDeleteProductFromList());
  }

  reset(){
     remainingWeight=0;
     carWeight=0;
     isBreakable=0;
     brokeText="غير قابل للكسر";
     formKey.currentState!.reset();
     formAddProduct.currentState!.reset();
    formKeyDropDown1.currentState!.reset();
    formKeyDropDown2.currentState!.reset();
    formKeyDropDown3.currentState!.reset();
   longController.clear();
    countController.clear();
    heightController.clear();
    widthController.clear();
    nameProductController.clear();
    itemMapOfProductList=[];
    itemProductList=[];

    emit(SucessResetData());
  }
///dropDown
  CountariesAndCitiesModel? countariesAndCitiesModel;
  var currentIdCityMove;
  var currentIdStateMove;
  var currentIdCityArrived;
  var currentIdStateArrived;
  var carId;
  var carWeight=0;
  List allCountriesMove=[];
  List allCitiessMove=[];
  List allCountriesArrived=[];
  List allCitiessArrived=[];
  List cars=[];
  int isBreakable=0;
  String brokeText="غير قابل للكسر";

  void getCountariesMove()
  {
    allCountriesMove = [];
    DioHelper.getData(
      authorization: "Bearer ${token}",
      url: "api/mobile/province-area-shipment",)
        .then((value)  {
      print('B4>>>>>>>>getCountariesClient>>>>>>>>>:${value.data}');
      countariesAndCitiesModel=CountariesAndCitiesModel.fromJson(value.data);
      countariesAndCitiesModel!.province!.forEach((element) {
        allCountriesMove!.add(element);
      });
      print("ccccccxccc${allCountriesMove}");
      emit(GetCitiesDataSuccess());
    }).catchError((erorr){
      print(erorr);
      emit(GetCitiesDataErorr());
    });
  }

  void onCountryChangeMove(dynamic countryItem)
  {
    allCitiessMove=[];
    log(jsonEncode(countryItem)) ;

    for(var i  = 0 ; i < countryItem.areas!.length  ; i++ )
    {
      allCitiessMove!.add(countryItem.areas[i]);
      log(allCitiessMove![i].name.toString()) ;
    }

    emit(SelectChoiceSuccessState());
  }

  void getCountariesArrived()
  {
    allCountriesArrived= [];
    DioHelper.getData(
      authorization: "Bearer ${token}",
      url: "api/mobile/province-area-shipment",
    )
        .then((value)  {
      print('B4>>>>>>>>getCountariesClient>>>>>>>>>:${value.data}');
      countariesAndCitiesModel=CountariesAndCitiesModel.fromJson(value.data);
      countariesAndCitiesModel!.province!.forEach((element) {
        allCountriesArrived!.add(element);
      });
      print("ccccccxccc${allCountriesArrived}");
      emit(GetCitiesDataSuccess());
    }).catchError((erorr){
      print(erorr);
      emit(GetCitiesDataErorr());
    });
  }

  void onCountryChangeArrived(dynamic countryItem)
  {
    allCitiessArrived=[];
    log(jsonEncode(countryItem)) ;

    for(var i  = 0 ; i < countryItem.areas!.length  ; i++ )
    {
      allCitiessArrived!.add(countryItem.areas[i]);
      log(allCitiessArrived![i].name.toString()) ;
    }

    emit(SelectChoiceSuccessState());
  }

  ///calculate Shipment
  CarsModel? carsModel;
  void getCars()
  {
    cars=[];
    DioHelper.getData(
      authorization: "Bearer ${token}",
      url: "api/mobile/indexCar",
    ).then((value)  {
      print('B4>>>>>>>>Carssssssssss>>>>>>>>>:${value.data}');
      carsModel=CarsModel.fromJson(value.data);
      carsModel!.car!.forEach((element) {
        cars!.add(element);
      });
      emit(SucessGetCarsState());
    }).catchError((erorr){
      print(erorr);
      emit(ErorrGetCarsState());
    });
  }
  num? price;
  void getPrice()
  {
    DioHelper.getData(
      authorization: "Bearer ${token}",

      url: "api/mobile/indexWeight",
    ).then((value)  {
      print('B4>>>>>>>>indexWeight>>>>>>>>>:${value.data['Weight'][0]}');
      price=value.data['Weight'][0]["price"];
      print("!!!!!!!>${price}");
      emit(SucessGetCarsState());
    }).catchError((erorr){
      print(erorr);
      emit(ErorrGetCarsState());
    });
  }

    changeCarWeight(value){
      carWeight=value.carWeight;
      emit(getCarWeight());
    }

  void changeBreakableState(value)
    {
      if(value)
      {
        isBreakable=1;
        brokeText="قابل للكسر";
      }
      else  {
        isBreakable=0;
        brokeText="غير قابل للكسر";
      }
      emit(BrokeState());
    }


  getTotalPrice(){
    num totalPrice=0;
    for(var i  = 0 ; i < itemProductList.length; i++ )
    {
      totalPrice+=itemProductList[i].price;

    }
    emit(getTotalPriceState());
    return totalPrice;
  }
 void calculateShipments()
 {
   print("calculateShipments$token");
   DioHelper.postData(
     authorization:  "Bearer ${token}",
     accessToken:  "",
     token: '',
     url: "api/mobile/calculateShipments",
     data: {
       "car_id":carId,
       "start_area_id":currentIdStateMove,
       "end_area_id":currentIdStateArrived,
       "breakable":isBreakable,
       "calculate_products":itemMapOfProductList,
     },
   ).then((value) {
     log('B5>>>>>>>>calculateShipments>>>>>>>>>: ${value.data}');
     emit(SucessCalculateShipmentsState());
   }).catchError((e){
     emit(ErorrCalculateShipmentsState());
   });
 }


}
