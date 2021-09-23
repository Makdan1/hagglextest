import 'package:flutter/material.dart';
import 'package:hagglextest/core/model/resend_verification_model.dart';
import 'package:hagglextest/core/model/verify_model.dart';
import 'package:hagglextest/core/services/auth_service.dart';
import 'package:hagglextest/ui/screens/register/registerViewModel.dart';
import 'package:hagglextest/ui/widget/general_button.dart';
import 'package:hagglextest/utils/colors.dart';
import 'package:hagglextest/utils/helpers.dart';
import 'package:hagglextest/utils/locator.dart';
import 'package:stacked/stacked.dart';

class VerificationView extends StatefulWidget {
  final String email;
  VerificationView({Key key, this.email}) : super(key: key);
  @override
  _VerifyPhonePageState createState() => _VerifyPhonePageState();
}

class _VerifyPhonePageState extends State<VerificationView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController verifyController = TextEditingController();
  final Authentication _authentication = locator<Authentication>();

  @override
  Widget build(BuildContext context) {
    ThemeData t = Theme.of(context);
    return ViewModelBuilder<RegisterViewModel>.reactive(
        onModelReady: (v) {},
        viewModelBuilder: () => RegisterViewModel(),
        builder: (context, model, child) {
          return Scaffold(
              backgroundColor: AppColors.primaryColor,
              body: SafeArea(
                  child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10.0),
                    child: Column(children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 20.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.white.withOpacity(0.2),
                            ),
                            width: 55,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 8.0, bottom: 8.0),
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 10.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Verify your account",
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              child: Image.asset(
                                'assets/images/mark.png',
                                width: 100,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                                "We just sent a verification link to your email."),
                            Text("Please enter this code"),
                            SizedBox(height: 15),
                            Form(
                              key: _formKey,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: verifyController,
                                    validator: isEmpty,
                                    decoration: InputDecoration(
                                      hintText: 'Verification code',
                                      hintStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                      labelStyle:
                                          TextStyle(color: AppColors.lowGrey),
                                      focusColor: AppColors.lowGrey,
                                    ),
                                    onChanged: (v) {
                                      setState(() {
                                        // model.phoneNumber = v;
                                      });
                                    },
                                    keyboardType: TextInputType.name,
                                    style: TextStyle(color: Colors.black),
                                    cursorColor: Colors.black,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                      padding: EdgeInsets.all(30),
                                      child: GeneralButton(
                                        onPressed: () {
                                          model.verifyOtp(VerifyModel(
                                              code: int.parse(
                                                  verifyController.text)));
                                          //_navigationService.navigateReplacementTo(RegistrationDoneRoute);
                                        },
                                        buttonText: "CHECK VERIFICATION",
                                      )),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    "This link will expire in 10 minutes",
                                    style: TextStyle(
                                      fontSize: 11,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      print(_authentication.email);
                                      model.reVerifyOtp(ResendVerificationModel(
                                          email: _authentication.email));
                                    },
                                    child: Text(
                                      "Resend Code",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ])),
              )));
        });
  }
}
