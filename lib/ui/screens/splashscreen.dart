
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hagglextest/utils/colors.dart';
import 'package:hagglextest/utils/locator.dart';
import 'package:hagglextest/utils/router/navigation_service.dart';
import 'package:hagglextest/utils/router/route_names.dart';

class AnimatedSplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<AnimatedSplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;
  final NavigationService _navigationService = locator<NavigationService>();
  AnimationController animationController;
  Animation<double> animation;
  String HOME='/LoginPage';
  String HOME_SCREEN ='/LandingPage';
  //String HOME_SCREEN ='/LoginPage';

  //
  startTime() async {
    var _duration = new Duration(seconds: 4);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async{
    _navigationService.navigateReplacementTo(LoginRoute);
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));
    animation =
    new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Image.asset(
                  'assets/images/logo.png',
                  width: 50,
                  height: 50,
                ),

                Text('HaggleX',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,color: Colors.white),)
              ]
          ),
        ],
      ),
    );
  }
}



