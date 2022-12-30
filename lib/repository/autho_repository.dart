
import 'package:restapi_with_mvvm_cleancode_architecture/data/netwrok/BaseApiServices.dart';
import 'package:restapi_with_mvvm_cleancode_architecture/data/netwrok/NetworkApiService.dart';
import 'package:restapi_with_mvvm_cleancode_architecture/res/app_url.dart';

class AuthRepository{

  BaseApiServices _apiServices=NetwrokApiService();
  Future<dynamic> loginApi(dynamic data) async{
    try{
      dynamic response=await _apiServices.getPostApiResponse(AppUrl.loginApiEndPoint, data);
      return response;
    }catch(e){
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async{
    try{
      dynamic response=await _apiServices.getPostApiResponse(AppUrl.registerApiEndPoint, data);
      return response;
    }catch(e){
      throw e;
    }
  }

}