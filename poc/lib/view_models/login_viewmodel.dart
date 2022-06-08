import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:poc/utils/preference.dart';
import 'package:poc/utils/navig.dart';
import 'package:poc/utils/preference_helper.dart';
import 'package:poc/view/dashboard.dart';
import 'package:poc/view/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/alertdialoges.dart';

class LoginViewModel extends ChangeNotifier with Navig, AlertDiag, PreferenceHelper, Preferences {
  bool isLoading = false;

  final TextEditingController conUsername = TextEditingController();
  final TextEditingController conPassword = TextEditingController();

  Future<void> authenticationLog(String username, String password) async {
    isLoading = true;
    notifyListeners();
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('email', user.email ?? '');
        prefs.setString('DisName', user.displayName ?? ' -- ');
        showToast('Login Successful');
        pushAndRemoveUntil(const DashBoard());
        isLoading = false;
      } else {
        showHttpFailureDialog(
            message: ' Invalid Login Details ', callback: () {});
      }
      isLoading = false;
      notifyListeners();
    } catch (e) {
      showToast('Error ${e.toString()}');
      isLoading = false;
      debugPrint("Error ${e.toString()}");
    }
    notifyListeners();
  }

  Future<void> authenticationSignUp(String username, String password) async {
    isLoading = true;
    notifyListeners();
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      showToast('SignUp Successfull');
      pushAndRemoveUntil(const LoginView());
      isLoading = false;
    } else {
      showHttpFailureDialog(message: 'Wrong Details ', callback: () {});
    }
    isLoading = false;
    notifyListeners();
  }

  bool validations() {
    if (conUsername.text.isEmpty) {
      showSnack('Enter emailId');
      return false;
    } else if (conPassword.text.isEmpty) {
      showSnack('Enter password');
      return false;
    } else {
      return true;
    }
  }
}