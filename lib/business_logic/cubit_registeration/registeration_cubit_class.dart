import 'dart:convert';
import 'dart:developer';
import 'package:client_rocket/business_logic/cubit_registeration/states.dart';
import 'package:client_rocket/business_logic/models/cities_of_registreation.dart';
import 'package:client_rocket/business_logic/models/countaries_and_cities.dart';
import 'package:client_rocket/helper_methods/dio_helper/dio.dart';
import 'package:client_rocket/helper_methods/sharedpref/shared_preference.dart';
import 'package:client_rocket/resource/constants_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RegisterationCubitClass extends Cubit<RegisterStates> {
  RegisterationCubitClass() : super(RegisterStatesInitState());

  static RegisterationCubitClass get(context) => BlocProvider.of(context);

// client data
  TextEditingController nameClientController = TextEditingController();
  TextEditingController phoneForClientController = TextEditingController();
  TextEditingController userNameClientController =TextEditingController();
  TextEditingController emailClientController = TextEditingController();
  TextEditingController passwordClientController = TextEditingController();
  TextEditingController rePasswordClientController = TextEditingController();
  String? erorrPhone;
  String? erorrClient;
  String? erorrEmail;
  String? erorrMessage;

  ///Login Data
  TextEditingController phoneController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  String errorMessage = "";

  void resetAll() {
    // company clear
    nameClientController = TextEditingController();
    phoneForClientController = TextEditingController();
    emailClientController = TextEditingController();
    passwordClientController = TextEditingController();
    rePasswordClientController = TextEditingController();
    userNameClientController= TextEditingController();

    emit(ResetControllersSuccessState());
  }

  bool isPasswordRegister = true;
  void makeItReadAbleRegister() {
    isPasswordRegister = !isPasswordRegister;
    emit(SwapSeeAndNotSuccessState());
  }
  bool isPasswordconfirm = true;
  void makeItReadAbleConfirmedRegister() {
    isPasswordconfirm = !isPasswordconfirm;
    emit(SwapSeeAndNotSuccessState());
  }
  bool isPasswordLogin = true;
  void makeItReadAbleLogin() {
    isPasswordLogin = !isPasswordLogin;
    emit(SwapSeeAndNotSuccessState());
  }


  CitiesOfRegisterration? citiesOfRegisterration;
  var currentIdCity;
  var currentIdState;
  List allCountries=[];
  List allCitiess=[];

  void getCountaries()
  {
    allCountries = [];
    DioHelper.getData(
      authorization: "",
      url: "api/mobile/city",
    )
        .then((value)  {
      print('B4>>>>>>>>getCountariesClient>>>>>>>>>:${value.data}');
      citiesOfRegisterration=CitiesOfRegisterration.fromJson(value.data);
      citiesOfRegisterration!.governorate!.forEach((element) {
        allCountries!.add(element);
      });
      print("ccccccxccc${allCountries}");
      emit(GetCitiesDataSuccess());
    }).catchError((erorr){
      print(erorr);
      emit(GetCitiesDataSuccess());
    });
  }

  void onCountryChange(dynamic countryItem)
  {
    allCitiess=[];
    log(jsonEncode(countryItem)) ;

    for(var i  = 0 ; i < countryItem.citie!.length  ; i++ )
    {
      allCitiess!.add(countryItem.citie[i]);
      log(allCitiess![i].name.toString()) ;
    }

    emit(SelectChoiceSuccessState());
  }

  ///Register Client
  void registerClient(){
    emit(RegisterClientLoadingState());
    DioHelper.postData(
      authorization: "",
      accessToken: '',
      token: '',
      url: "api/mobile/register",
      data: {
        "user_name":userNameClientController.text,
        "name": nameClientController.text,
        "phone_number": phoneForClientController.text,
        "email": emailClientController.text,
        "password": passwordClientController.text,
        "password_confirmation": rePasswordClientController.text,
        "city_id": currentIdCity,
      },
    ).then((value) {
      log('B5>>>>>>>>RegisterClient>>>>>>>>>: ${value.data}');
      emit(RegisterClientSuccessState());

    }).catchError((e){
        print('B1>>>>>>>>ErorrrrrrrregisterClient>>>>>>>>>${ e.response!.data["errors"]["email"]}');
        erorrEmail="${e.response!.data["errors"]["email"]}";
        erorrPhone="${e.response!.data["errors"]["phone_number"]}";
        erorrClient="${e.response!.data["errors"]["user_name"]}";
        erorrMessage="${'${erorrEmail!="null"  ?'$erorrEmail\n':""}'+'${erorrClient!="null"?'$erorrClient\n':""}'+'${erorrPhone!="null"?'$erorrPhone\n':""}'}";
      emit(RegisterClientErrorState(e.toString()));
    });
  }
  ///Login Client
  void loginClient(){
    emit(LoginLoadingState());
    DioHelper.postData(
      authorization: "",
      accessToken: '',
      token: '',
      url: "api/mobile/loginClient",
      data: {
        "phone_number":phoneController.text,
        "password": passWordController.text,
      },
    ).then((value) {
      log('B5>>>>>>>>LoginClient>>>>>>>>>: ${value.data}');
      log('B5>>>>>>>>accessToken>>>>>>>>>: ${ value.data["access_token"]}');
       token=value.data["access_token"];
      SharedCashHelper.setValue(key: "accessToken", value: value.data["access_token"]);
      //SharedCashHelper.setValue(key: "clientId", value: value.data["id"]);
      emit(LoginSuccessState());

    }).catchError((e){
      if (e.response!.statusCode == 422) {
        if (e.response!.data["errNum"] == "0"||e.response!.data["errNum"] == "2") {
          errorMessage = "لا يوجد حساب مسجل بهذا الرقم";
        }
        else if (e.response!.data["errNum"] == "1") {
          errorMessage = "كلمة السر غير صحيحة";
        }
      /*  else if(e.response!.data["errors"]["status"] == "not active company") {

          errorMessage="الاكونت غير مفعل";
        }*/
        else {
          errorMessage = "كلمة السر غير صحيحة";
        }
        emit(ShowErrorInSnackBar());
      }
      emit(LoginErorrState());
      log("qqqqqqqqq$errorMessage");
    });
  }
}


