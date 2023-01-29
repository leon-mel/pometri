import 'package:speeddatingapp/UI/Options/Preferences/Preferences.dart';
import 'package:speeddatingapp/UI/Options/SettingsPageUI.dart';
import 'package:speeddatingapp/UI/PasswordReset/ForgotPassword/forgotPasswordMain.dart';
import 'package:speeddatingapp/UI/Login/loginMain.dart';
import 'package:speeddatingapp/UI/Registration/TermsOfServicePopUp/termsOfService.dart';
import 'package:speeddatingapp/UI/Registration/registrationMain.dart';
import '../../UI/Options/Optionmenu.dart';
import '../../homemenu/landingPage.dart';
import '../../navigator/profileScreen.dart';

getRoutes() {
  return {
    Login.route: (context) => const Login(),
    Register.route: (context) => const Register(),
    ForgotPassword.route: (context) => const ForgotPassword(),
    TermsOfServicePopUp.route: (context) => const TermsOfServicePopUp(),
    ProfileScreen.route: (context) => const ProfileScreen(),
    LandingPage.route: (context) => const LandingPage(),
    Optionmenu.route: (context) => const Optionmenu(),
    SettingPage.route: (context) => const SettingPage(),
    Preferences.route: (context) => const Preferences(),
  };
}
