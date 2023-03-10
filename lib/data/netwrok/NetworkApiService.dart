import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:restapi_with_mvvm_cleancode_architecture/data/app_exceptions.dart';
import 'package:restapi_with_mvvm_cleancode_architecture/data/netwrok/BaseApiServices.dart';
import 'package:http/http.dart' as http;

class NetwrokApiService extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url)).timeout(
          Duration(seconds: 10));
      responseJson=returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url,dynamic data) async {
    dynamic responseJson;
    try {
      Response response=await post(Uri.parse(url),body:data).timeout(Duration(seconds: 10));
      responseJson=returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());

      case 500:
      case 404:
        throw BadRequestException(response.body.toString());

      default:
        throw FetchDataException(
            "Error occured while communication with server + with sercer code" +
                response.statusCode.toString());
    }
  }

}