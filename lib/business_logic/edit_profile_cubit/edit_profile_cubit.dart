
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:client_rocket/business_logic/models/countaries_and_cities.dart';
import 'package:client_rocket/business_logic/models/user_profile_model.dart';
import 'package:client_rocket/helper_methods/dio_helper/dio.dart';
import 'package:client_rocket/helper_methods/sharedpref/shared_preference.dart';
import 'package:client_rocket/resource/constants_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'dart:io';   // for File
import 'package:http/http.dart' as http;
part 'edit_profile_state.dart';



class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  static EditProfileCubit get(context)=>BlocProvider.of(context) ;

   var cityId;
  TextEditingController clientIDController = TextEditingController();
  TextEditingController updateUserNameController = TextEditingController();
  TextEditingController updateNameController = TextEditingController();
  TextEditingController updatePhoneController = TextEditingController();
  TextEditingController updateEmailController = TextEditingController();
  TextEditingController updateCityController = TextEditingController();


  File? image;
  var imageFile;

  getImageGallery() async {
    imageFile = (await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 50));
    if (imageFile != null) {
      image = File(imageFile.path);
      await SharedCashHelper.setValue(key: "imagePath", value: imageFile.path!);
      log("ImageFile>>${Image.file(image!).toString()}");
      emit(GetImageSuccesEditState());
    } else {
      log('Error In Picking The Note Image');
    }
  }


   UserProfileModel? userProfileModel;

      getUserProfile(){
    DioHelper.getData(
      authorization:  "Bearer ${token}",
      url: "api/mobile/user-profile",
    ).then((value) {
      print('B4>>>>>>>>user-profile>>>>>>>>>${value.data}');
      userProfileModel=UserProfileModel.fromJson(value.data);
      clientIDController.text=userProfileModel!.userData!.id!.toString();
      updateUserNameController.text=userProfileModel!.userName!;
      updateNameController.text=userProfileModel!.userData!.name!;
      updatePhoneController.text=userProfileModel!.userData!.phone!;
      updateEmailController.text=userProfileModel!.userData!.email2!;
      emit(UserProfileSucessState());
    } ).catchError((){

      emit(UserProfileErorrState());
    });
  }
///Dont use it
      editUSerProfile(){
        log("cityId>>${cityId}");
    DioHelper.postData(
        url: "api/mobile/update-profile/${clientIDController.text}",
        token: "",
        accessToken: "",
        authorization:  "Bearer ${token}",
        data: {
              "name":updateNameController.text,
              "user_name":updateUserNameController.text,
              "email":updateEmailController.text,
               "phone":updatePhoneController.text,
                "city_id":"$cityId",
                 "address":"$cityId",
        }
        ).then((value) {
      print('B4>>>>>>>>user-profile>>>>>>>>>${value.data}');
        emit(UserProfileErorrState());
    }).catchError((){

      emit(UserProfileErorrState());
    });
  }
  ///Dont use it
  Future<dynamic> uploadImage() async {
    try {
      log("SSSS>${image!.path}");
      String fileName = imageFile.path.split('/').last;
      FormData   data = FormData.fromMap({
        'photo': await MultipartFile.fromFile(image!.path, filename:fileName),
        "name":updateNameController.text,
        "user_name":updateUserNameController.text,
        "email":updateEmailController.text,
        "phone":updatePhoneController.text,
        "city_id":"$cityId",
      });

      Response response = await DioHelper.postData(url: "api/mobile/update-profile/${clientIDController.text}",

          data:{
            'photo': await MultipartFile.fromFile(image!.path, filename:fileName),
            "name":updateNameController.text,
            "user_name":updateUserNameController.text,
            "email":updateEmailController.text,
            "phone":updatePhoneController.text,
            "city_id":"$cityId",
          },
          authorization: "Bearer ${token}",
          token:"" ,
          accessToken: '');
      emit(UserProfileErorrState());
      return response.data;
    } on DioError catch (e) {
      emit(UserProfileErorrState());
    }
  }

  Future<void>updateCompanyProfile(context) async{
        emit(UserProfileLoadingState());
    var headers = {
      'Authorization': 'Bearer ${token}'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse( "https://backend.rocketexpress.online/api/mobile/update-profile/${clientIDController.text}}")
    );
    request.fields.addAll({
      "name":updateNameController.text,
      "user_name":updateUserNameController.text,
      "email":updateEmailController.text,
      "phone":updatePhoneController.text,
      "city_id":"$cityId",
    });
    request.files.add(await http.MultipartFile.fromPath('photo', '${SharedCashHelper.getValue(key: "imagePath")}'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("UserUpdateDataProfile>>>>>>>"+await response.stream.bytesToString());
      ScaffoldMessenger.of(context)
          .showSnackBar(
          const SnackBar(
           content: Directionality(
             textDirection: TextDirection.rtl,
             child: Text(
              "تم تعديل البيانات بنجاح"),
           ),
         backgroundColor: Colors.green,
      ));
      emit(UserProfileSucessState());
    }
    else {
      print("===========");
      print(response.reasonPhrase.toString());
         emit(UserProfileErorrState());
    }
  }


  ///@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  List allCountries=[];
  List allCitiess=[];

  CountariesAndCitiesModel? countariesAndCitiesModel;
  void getCountaries()
  {
    allCountries = [];
    DioHelper.getData(
      authorization: "Bearer ${token}",
      url: "api/mobile/province-area-shipment",)
        .then((value)  {
      print('B4>>>>>>>>getCountariesClient>>>>>>>>>:${value.data}');
      countariesAndCitiesModel=CountariesAndCitiesModel.fromJson(value.data);
      countariesAndCitiesModel!.province!.forEach((element) {
        allCountries!.add(element);
      });
      print("ccccccxccc${allCountries}");
      emit(GetCitiesDataSuccess());
    }).catchError((erorr){
      print(erorr);
      emit(GetCitiesDataErorr());
    });
  }

  void onCountryChange(dynamic countryItem)
  {
    allCitiess=[];
    log(jsonEncode(countryItem)) ;

    for(var i  = 0 ; i < countryItem.areas!.length  ; i++ )
    {
      allCitiess!.add(countryItem.areas[i]);
      log(allCitiess![i].name.toString()) ;
    }
    emit(SelectChoiceSuccessState());
  }


}
