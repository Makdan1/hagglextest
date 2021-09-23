
import 'package:hagglextest/ui/screens/dashboard.dart';
import 'package:hagglextest/ui/screens/login/loginView.dart';
import 'package:hagglextest/ui/screens/register/country_list.dart';
import 'package:hagglextest/ui/screens/register/reg_finished.dart';
import 'package:hagglextest/ui/screens/register/register_view.dart';
import 'package:hagglextest/ui/screens/register/verificationView.dart';
import 'package:flutter/material.dart';
import 'package:hagglextest/utils/router/route_names.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: Login(),
      );

    case RegisterRoute:
      Map<String, dynamic> args = settings.arguments;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: Register(),
      );

    case VerificationViewRoute:
      var phoneNumber = settings.arguments as String;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: VerificationView(),
      );



    case RegistrationDoneRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: RegistrationDone(),
      );
    case DashboardRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: Dashboard(),
      );

    case CountryListRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: CountryListPage(),
      );



    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
