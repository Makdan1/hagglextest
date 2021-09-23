import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:snailmobile/utils/baseModel.dart';

//Created by Daniel Makinde
//This the service class for setting up preferred language

class LanguageService   {
  Locale _currentLanguage;
  bool _hasPrefferedLanguage;

  Locale get currentLanguage => _currentLanguage;
  bool get hasPrefferedLanguage => _hasPrefferedLanguage;

  setLocale() async {
    var prefs = await SharedPreferences.getInstance();

    //This checks if the 'language_code' is available
    if (prefs.getString('language_code') == null) {
      _currentLanguage = Locale('en');
      _hasPrefferedLanguage = false;
      print('Language empty');
      return null;
    }

    //if it is available it returns the code saved when selecting the language
    _hasPrefferedLanguage = true;
    _currentLanguage = Locale(prefs.getString('language_code'));
    print(_currentLanguage);
    return null;
  }


}
