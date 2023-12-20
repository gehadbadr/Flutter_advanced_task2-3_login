import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  bool isLoading = false;
  bool obscureText = false;

  changeisLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
  bool _isTrue = true;
  bool _isConfirmPassword = true;
  bool get isTrue => _isTrue;
  bool get isConfirmPassword => _isConfirmPassword;

  get switchPasswordIcon {
    return _isConfirmPassword ? Icon(Icons.visibility_off,) : Icon(Icons.visibility);
  }
 get switchConfirmPasswordIcon {
    return _isTrue ? Icon(Icons.visibility_off) : Icon(Icons.visibility);
  }
  void toggleObsData() {
    _isConfirmPassword = !_isConfirmPassword;
    notifyListeners();
  }
  void toggleObs() {
    _isTrue = !_isTrue;
    notifyListeners();
  }

  void toggleObscure(bool value) {
    obscureText = !value;
    notifyListeners();
  }
}
