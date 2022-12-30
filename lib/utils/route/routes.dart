import 'package:flutter/material.dart';
import 'package:restapi_with_mvvm_cleancode_architecture/utils/route/route_name.dart';
import 'package:restapi_with_mvvm_cleancode_architecture/view/login_screen.dart';
import 'package:restapi_with_mvvm_cleancode_architecture/view/main_screen.dart';
import 'package:restapi_with_mvvm_cleancode_architecture/view/signup_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      case RouteName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());

      case RouteName.signUp:
        return MaterialPageRoute(builder: (BuildContext context)=> const SignUpScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("No route defined"),
            ),
          );
        });
    }
  }
}
