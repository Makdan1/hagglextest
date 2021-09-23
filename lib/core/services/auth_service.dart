import 'dart:convert';

import 'package:hagglextest/core/model/country_model.dart';
import 'package:hagglextest/core/model/error_model.dart';
import 'package:hagglextest/core/model/sign_in_response.dart';
import 'package:hagglextest/core/model/success_model.dart';
import 'package:hagglextest/utils/graph_ql/graph_ql_service.dart';
import 'package:hagglextest/utils/graph_ql/mutations.dart';
import 'package:shared_preferences/shared_preferences.dart';

String tokenUniversal;

class Authentication {
  SignInResponse _currentUser;
  SignInResponse get currentUser => _currentUser;

  String _email;
  String get email => _email;

  String _token;
  String get token => _token;

  String _acctType;
  String get acctType => _acctType;

  saveRegEmail(String email) async {
    _email = email;
  }

  saveAcct(String acctType) async {
    _acctType = acctType;
  }

  login(Map<String, dynamic> payload) async {
    graphQlService config = graphQlService();
    var result = await config.gpMutate(
        mutationDocument: Mutations().login, data: payload);
    if (result is ErrorModel) {
      return ErrorModel(result.error);
    } else {
      print(result.data.toString());

      return SuccessModel(result.data);
    }
  }

  register(Map<String, dynamic> payload) async {
    graphQlService config = graphQlService();
    var result = await config.gpMutate(
        mutationDocument: Mutations().register, data: payload);
    if (result is ErrorModel) {
      return ErrorModel(result.error);
    } else {
      print(result.data);
      print(result.data['register']['token']);
      tokenUniversal = result.data['register']['token'];
      _token = result.data['register']['token'];
      SharedPreferences prefs;
      prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', result.data['register']['token']);
      return SuccessModel(result.data);
    }
  }

  verifyOtp(Map<String, dynamic> payload) async {
    graphQlService config = graphQlService();
    var result = await config.gpMutate(
        mutationDocument: Mutations().verify, data: payload);
    if (result is ErrorModel) {
      // print(result.error.toString());
      return ErrorModel(result.error);
    } else {
      print(result.data.toString());

      return SuccessModel(result.data);
    }
  }

  reVerifyOtp(Map<String, dynamic> payload) async {
    graphQlService config = graphQlService();
    var result = await config.gpQuery(
        queryDocument: Mutations().resendVerification, data: payload);
    if (result is ErrorModel) {
      // print(result.error.toString());
      return ErrorModel(result.error);
    } else {
      print(result.data.toString());
      return SuccessModel(result.data);
    }
  }

  fetchActiveCountries() async {
    graphQlService config = graphQlService();
    var result =
        await config.gpQuery(queryDocument: Mutations().country, data: {});
    if (result is ErrorModel) {
      return ErrorModel(result.error);
    } else {
      print(result.data);
      var data = result.data['getActiveCountries'];
      List<CountryModel> countryList = List<CountryModel>.from(
          data.map((item) => CountryModel.fromJson(item)));
      print(countryList);
      print('result');
      return countryList;
    }
  }
}
