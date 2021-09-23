import 'package:flutter_svg/flutter_svg.dart';
import 'package:hagglextest/core/model/country_model.dart';
import 'package:hagglextest/core/model/sign_up_body.dart';
import 'package:hagglextest/ui/screens/register/country_list.dart';
import 'package:hagglextest/ui/screens/register/registerViewModel.dart';
import 'package:hagglextest/ui/widget/general_button.dart';
import 'package:hagglextest/utils/colors.dart';
import 'package:hagglextest/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

class Register extends StatefulWidget {
  Register({
    Key key,
  }) : super(key: key);

  @override
  RegisterState createState() => new RegisterState();
}

class RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController referralController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  CountryModel country = CountryModel(
    name: 'Nigeria',
    callingCode: '234',
    currencyCode: 'NGN',
    flag: 'https://restcountries.eu/data/nga.svg',
  );
  bool passwordVisible;
  String ipAddress;
  var fcmToken;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  //
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
        onModelReady: (v) {},
        viewModelBuilder: () => RegisterViewModel(),
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
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 43,
                                  width: 43,
                                  decoration: BoxDecoration(
                                      color: Color(0XAA6A4BBC),
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.arrow_back_ios_outlined,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                ),
                                Text('')
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(
                                        10.0) //                 <--- border radius here
                                    ),
                              ),
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Create a new account",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Form(
                                      key: _formKey,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      child: Column(children: [
                                        TextFormField(
                                          controller: emailController,
                                          validator: isEmail,
                                          decoration: InputDecoration(
                                            labelText: 'Email Address',
                                            hintText: 'name@gmail.com',
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            labelStyle: TextStyle(
                                                color: AppColors.black),
                                            focusColor: AppColors.lowGrey,
                                          ),
                                          onChanged: (v) {
                                            model.saveEmail(v);
                                          },
                                          keyboardType: TextInputType.name,
                                          style: TextStyle(color: Colors.black),
                                          cursorColor: Colors.black,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        TextFormField(
                                          controller: passwordController,
                                          validator: isPassword,
                                          decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                // Based on passwordVisible state choose the icon
                                                passwordVisible
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                color: Colors.black,
                                              ),
                                              onPressed: () {
                                                // Update the state i.e. toogle the state of passwordVisible variable
                                                setState(() {
                                                  passwordVisible =
                                                      !passwordVisible;
                                                });
                                              },
                                            ),
                                            hintText: '********',
                                            labelText: 'Password (Min 8 characters)',
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            labelStyle: TextStyle(
                                                color: AppColors.black),
                                          ),
                                          obscureText: passwordVisible,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          style: TextStyle(color: Colors.black),
                                          cursorColor: Colors.black,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        TextFormField(
                                          controller: userNameController,
                                          // maxLength: 11,
                                          validator: isEmpty,
                                          decoration: InputDecoration(
                                            hintText: 'Doe',
                                            labelText: 'Create a username',
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            labelStyle: TextStyle(
                                                color: AppColors.black),
                                            focusColor: AppColors.lowGrey,
                                          ),
                                          onChanged: (v) {
                                            setState(() {
                                              // model.phoneNumber = v;
                                            });
                                          },
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          style: TextStyle(color: Colors.black),
                                          cursorColor: Colors.black,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                color: Colors.black12,
                                              ),
                                              child: FlatButton(
                                                onPressed: () async {
                                                  final country =
                                                      await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            CountryListPage()),
                                                  );

                                                  if (country == null) return;

                                                  setState(() =>
                                                      this.country = country);

                                                  //  Navigator.push(context, MaterialPageRoute(builder: (context) => StartHere1()));
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    SvgPicture.network(
                                                        country?.flag,
                                                        height: 14,
                                                        placeholderBuilder:
                                                            (context) {
                                                      return Image.asset(
                                                        "assets/images/nigeriaflag.png",
                                                        scale: 19.9,
                                                      );
                                                    }),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 3),
                                                      child: Container(
                                                        width: 1,
                                                        height: 30,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                    Text(country.callingCode !=
                                                            null
                                                        ? '+' +
                                                            country.callingCode
                                                        : '+234'),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Expanded(
                                              child: TextField(
                                                controller: phoneController,
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                  labelText:
                                                      'Enter your phone number',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        TextFormField(
                                          controller: referralController,
                                          // maxLength: 11,
                                          decoration: InputDecoration(
                                            hintText:
                                                'Referral code (optional)',
                                            hintStyle: TextStyle(
                                              color: Colors.black45,
                                            ),
                                            labelStyle: TextStyle(
                                                color: AppColors.lowGrey),
                                            focusColor: AppColors.lowGrey,
                                          ),
                                          onChanged: (v) {
                                            setState(() {
                                              // model.phoneNumber = v;
                                            });
                                          },
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          style: TextStyle(color: Colors.black),
                                          cursorColor: Colors.black,
                                        ),
                                      ])),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                    child: InkWell(
                                      onTap: () {
                                        // _navigationService.navigateTo(SendOTPRoute);
                                      },
                                      child: Text(
                                        'By signing, you agree to HaggleX terms and privacy policy.',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.all(20),
                                      child: GeneralButton(
                                        onPressed: () {
                                          if (_formKey.currentState
                                              .validate()) {
                                            _formKey.currentState.save();
                                            model.signUp(SignUpBody(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text,
                                                username:
                                                    userNameController.text,
                                                phonenumber:
                                                    phoneController.text,
                                                referralCode:
                                                    referralController.text,
                                                country: country.name,
                                                currency: country.currencyCode,
                                                phoneNumberDetails:
                                                    PhoneNumberDetails(
                                                  callingCode:
                                                      country.callingCode,
                                                  phoneNumber:
                                                      phoneController.text,
                                                  flag: country.flag,
                                                )));
                                          }
                                        },
                                        buttonText: 'SIGN UP',
                                        buttonTextColor: AppColors.white,
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            )
                          ]))));
        });
  }
}
