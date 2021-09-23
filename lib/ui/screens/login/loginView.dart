import 'package:hagglextest/core/model/sign_in_body.dart';
import 'package:hagglextest/ui/screens/login/loginViewModel.dart';
import 'package:hagglextest/ui/widget/general_button.dart';
import 'package:hagglextest/utils/colors.dart';
import 'package:hagglextest/utils/helpers.dart';
import 'package:hagglextest/utils/locator.dart';
import 'package:hagglextest/utils/router/navigation_service.dart';
import 'package:hagglextest/utils/router/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => new LoginState();
}

class LoginState extends State<Login> {
  final NavigationService _navigationService = locator<NavigationService>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisible;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        onModelReady: (v) {},
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, model, child) {
          return Scaffold(
              backgroundColor: AppColors.primaryColor,
              body: SingleChildScrollView(
                  child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome!",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                    Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(children: [
                          TextFormField(
                            controller: emailController,
                            // maxLength: 11,
                            validator: isEmpty,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              hintText: 'Email address',
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              labelStyle: TextStyle(color: AppColors.white),
                              focusColor: AppColors.lowGrey,
                            ),
                            onChanged: (v) {
                              setState(() {});
                            },
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: isPassword,
                            controller: passwordController,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              labelStyle: TextStyle(color: AppColors.white),
                            ),
                            obscureText: passwordVisible,
                            keyboardType: TextInputType.visiblePassword,
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                          ),
                        ])),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(''),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: GeneralButton(
                          splashColor: AppColors.gold,
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              model.signIn(SignInBody(
                                input: emailController.text,
                                password: passwordController.text,
                              ));
                            }
                          },
                          buttonText: 'LOG IN',
                          buttonTextColor: AppColors.black,
                        )),
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                        child: InkWell(
                      onTap: () {
                        _navigationService.navigateTo(RegisterRoute);
                      },
                      child: Text(
                        'New User?Create a new account',
                        style: TextStyle(
                            fontSize: 15,
                            color: AppColors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ))
                  ],
                ),
              )));
        });
  }
}
