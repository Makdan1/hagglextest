
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hagglextest/ui/screens/splashscreen.dart';
import 'package:hagglextest/utils/locator.dart';
import 'package:hagglextest/utils/progressBarManager/dialog_manager.dart';
import 'package:hagglextest/utils/progressBarManager/dialog_service.dart';
import 'package:hagglextest/utils/router/navigation_service.dart';
import 'package:hagglextest/utils/router/router.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MyApp());
}


class MyApp extends  StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HaggleX Test',
      builder: (context, child) => Navigator(
        key: locator<ProgressService>().progressNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) {
          return ProgressManager(child: child);
          //DialogManager(child: child);
        }),
      ),
      theme: ThemeData(
        textTheme: GoogleFonts.mulishTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      home: AnimatedSplashScreen(),
      onGenerateRoute: generateRoute,
    );
  }
}
