import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:restapi_with_mvvm_cleancode_architecture/repository/autho_repository.dart';
import 'package:restapi_with_mvvm_cleancode_architecture/utils/route/route_name.dart';
import 'package:restapi_with_mvvm_cleancode_architecture/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _authRepo = AuthRepository();
  bool _loading=false;
  bool get loading=>_loading;
  setLoading(bool value){
    _loading=value;
    notifyListeners();
  }

  bool _signupLoading=false;
  bool get signupLoading=>_signupLoading;
  setSignUpLoading(bool value){
    _signupLoading=value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data,BuildContext context) async {
    setLoading(true);
    _authRepo
        .loginApi(data)
        .then((value) {
          setLoading(false);
          Navigator.pushNamed(context, RouteName.home);
          if(kDebugMode){
            print(value.toString());
          }
    })
        .onError((error, stackTrace){
          if(kDebugMode){
            setLoading(false);
            print(error.toString());
            Utils.flashBarErrorMessage(error.toString(), context);
          }
    });
  }

  Future<void> signUpApi(dynamic data,BuildContext context) async {
    setSignUpLoading(true);
    _authRepo
        .registerApi(data)
        .then((value) {
      setSignUpLoading(false);
      Navigator.pushNamed(context, RouteName.home);
      if(kDebugMode){
        print(value.toString());
      }
    })
        .onError((error, stackTrace){
      if(kDebugMode){
        setSignUpLoading(false);
        print(error.toString());
        Utils.flashBarErrorMessage(error.toString(), context);
      }
    });
  }
}
