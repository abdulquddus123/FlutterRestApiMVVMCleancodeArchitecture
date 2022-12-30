import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../res/components/round_button.dart';
import '../utils/route/route_name.dart';
import '../utils/utils.dart';
import '../view_model/autho_viewmodel.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}


class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final _authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              decoration: const InputDecoration(
                  hintText: 'Enter email',
                  labelText: 'Enter email',
                  prefixIcon: Icon(Icons.email)),
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(
                    context, emailFocusNode, passwordFocusNode);
              },
            ),
            ValueListenableBuilder(
              valueListenable: _obsecurePassword,
              builder: (context, value, child) {
                return TextFormField(
                  controller: _passwordController,
                  focusNode: passwordFocusNode,
                  obscureText: _obsecurePassword.value,
                  decoration: InputDecoration(
                      hintText: "Enter password",
                      labelText: "Enter password",
                      prefixIcon: Icon(Icons.lock_open_rounded),
                      suffixIcon: InkWell(
                        onTap: () {
                          _obsecurePassword.value = !_obsecurePassword.value;
                        },
                        child: Icon(_obsecurePassword.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility),
                      )),
                );
              },
            ),
            SizedBox(height: 20,),
            RoundButton(title: "Register",
              loading: _authViewModel.loading,
              onPress: () {
                if (_emailController.text.isEmpty) {
                  Utils.flashBarErrorMessage(
                      "Please enter your email", context);
                }
                else if (_passwordController.text.isEmpty) {
                  Utils.flashBarErrorMessage("Enter your password", context);
                }
                else if(_passwordController.text.length<6){
                  Utils.flashBarErrorMessage("Please enter 6 digit password", context);
                }else {
                  Map data={
                    'email':_emailController.text.toString(),
                    'password':_passwordController.text.toString()
                  };
                  _authViewModel.signUpApi(data,context);
                  print("api call");
                }
              },),
            SizedBox(
              height: 20,
            ),
            InkWell(onTap: () {
              Navigator.pushNamed(context, RouteName.login);
            }, child: Text("Already have account ? Login "))
          ],
        ),
      ),
    );
  }
}