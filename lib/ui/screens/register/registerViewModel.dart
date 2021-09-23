import 'package:hagglextest/core/model/country_model.dart';
import 'package:hagglextest/core/model/error_model.dart';
import 'package:hagglextest/core/model/resend_verification_model.dart';
import 'package:hagglextest/core/model/sign_up_body.dart';
import 'package:hagglextest/core/model/success_model.dart';
import 'package:hagglextest/core/model/verify_model.dart';
import 'package:hagglextest/core/services/auth_service.dart';
import 'package:hagglextest/utils/base_model.dart';
import 'package:hagglextest/utils/helpers.dart';
import 'package:hagglextest/utils/locator.dart';
import 'package:hagglextest/utils/router/navigation_service.dart';
import 'package:hagglextest/utils/router/route_names.dart';

class RegisterViewModel extends BaseModel {
  final Authentication _authentication = locator<Authentication>();
  final NavigationService _navigationService = locator<NavigationService>();


  signUp(SignUpBody signUpBody) async {
    setBusy(true);
    var result = await _authentication.register(signUpBody.toJson());
    if (result is ErrorModel) {
      setBusy(false);
      showErrorToast('Registration not successful');
      print(result.error);
      notifyListeners();
      return ErrorModel(result.error);
    }
    if (result is SuccessModel) {
      setBusy(false);
      _navigationService.navigateTo(VerificationViewRoute);

      notifyListeners();
      return SuccessModel(result.data);
    }
  }

  Future<List<CountryModel>> getCountries() async {
    //setBusy(true);
    var result = await _authentication.fetchActiveCountries();
    if (result is ErrorModel) {
      // showToast('Login failed');
      print(result.error);
      notifyListeners();
      throw Exception('Failed to load internet');
      //return ErrorModel(result.error);
    }
    print(result);
    return result;
  }

  saveEmail(
    String email,
  ) async {
    _authentication.saveRegEmail(email);
    notifyListeners();
  }


  verifyOtp(VerifyModel verifyModel) async {
    setBusy(true);
    var result = await _authentication.verifyOtp(verifyModel.toJson());

    if (result is ErrorModel) {
      //setBusy(false);
      setBusy(false);

      showErrorToast('Invalid OTP');
      print(result.error);
      notifyListeners();
      return ErrorModel(result.error);
    }
    if (result is SuccessModel) {
      setBusy(false);

      print(result.data);
      _navigationService.navigateReplacementTo(RegistrationDoneRoute);
      notifyListeners();
      return SuccessModel(result.data);
    }
  }

  reVerifyOtp(ResendVerificationModel resendVerificationModel) async {
    setBusy(true);
    var result =
        await _authentication.reVerifyOtp(resendVerificationModel.toJson());
    if (result is ErrorModel) {
      setBusy(false);
      showErrorToast('Invalid Email');
      print(result.error);
      notifyListeners();
      return ErrorModel(result.error);
    }
    if (result is SuccessModel) {
      setBusy(false);
      print(result.data);
      showErrorToast('Resent successfully');
     notifyListeners();
      return SuccessModel(result.data);
    }
  }


}
