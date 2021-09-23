import 'package:hagglextest/ui/screens/register/registerViewModel.dart';
import 'package:hagglextest/ui/widget/general_button.dart';
import 'package:hagglextest/utils/colors.dart';
import 'package:hagglextest/utils/locator.dart';
import 'package:hagglextest/utils/router/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hagglextest/utils/router/route_names.dart';
import 'package:stacked/stacked.dart';

class RegistrationDone extends StatefulWidget {
  RegistrationDone();

  @override
  _OnBoardingDoneState createState() => _OnBoardingDoneState();
}

class _OnBoardingDoneState extends State<RegistrationDone> {
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
        onModelReady: (v) {},
        viewModelBuilder: () => RegisterViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: AppColors.primaryColor,
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(
                      flex: 1,
                    ),
                    Image.asset(
                      "assets/images/tick.png",
                      width: 100,
                      fit: BoxFit.fitWidth,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Setup Complete",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Thank you for setting up your HaggleX account",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    Padding(
                        padding: EdgeInsets.all(30),
                        child: GeneralButton(
                          onPressed: () {
                            _navigationService.navigateTo(DashboardRoute);
                          },
                          splashColor: AppColors.gold,
                          buttonText: "START EXPLORING",
                          buttonTextColor: Colors.black,
                        )),
                    Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
