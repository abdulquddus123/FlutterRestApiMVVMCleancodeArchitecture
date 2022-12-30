import 'package:restapi_with_mvvm_cleancode_architecture/data/response/status.dart';

class ApiResponse<T>{
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status,this.data,this.message);
  ApiResponse.Loading():status=Status.LOADING;
  ApiResponse.Error():status=Status.ERROR;
  ApiResponse.Complete():status=Status.COMPLETE;

  @override
  String toString() {
    return "Status $status \n Message $message \n Data $data";
  }
}