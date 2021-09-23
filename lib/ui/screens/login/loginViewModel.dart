import 'package:hagglextest/core/model/error_model.dart';
import 'package:hagglextest/core/model/sign_in_body.dart';
import 'package:hagglextest/core/model/success_model.dart';
import 'package:hagglextest/core/services/auth_service.dart';
import 'package:hagglextest/utils/base_model.dart';
import 'package:hagglextest/utils/helpers.dart';
import 'package:hagglextest/utils/locator.dart';
import 'package:hagglextest/utils/router/navigation_service.dart';
import 'package:hagglextest/utils/router/route_names.dart';

class LoginViewModel extends BaseModel {
  final Authentication _authentication = locator<Authentication>();
  final NavigationService _navigationService = locator<NavigationService>();
  signIn(SignInBody signInBody) async {
    setBusy(true);
    var result = await _authentication.login(signInBody.toJson());

    if (result is ErrorModel) {
      setBusy(false);
      showErrorToast('Incorrect login details');
      print(result.error);
      notifyListeners();
      return ErrorModel(result.error);
    }
    if (result is SuccessModel) {
      setBusy(false);
      _navigationService.navigateTo(DashboardRoute);
      notifyListeners();
      return SuccessModel(result.data);
    }
  }
}
