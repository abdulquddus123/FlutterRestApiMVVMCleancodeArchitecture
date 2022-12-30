import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restapi_with_mvvm_cleancode_architecture/utils/route/route_name.dart';
import 'package:restapi_with_mvvm_cleancode_architecture/utils/route/routes.dart';
import 'package:restapi_with_mvvm_cleancode_architecture/view/login_screen.dart';
import 'package:restapi_with_mvvm_cleancode_architecture/view_model/autho_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>AuthViewModel())
    ], child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteName.login,
      onGenerateRoute: Routes.generateRoute,
    ),);
  }
}


