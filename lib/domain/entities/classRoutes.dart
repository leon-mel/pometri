import 'package:speeddatingapp/UI/Chat/ChatScreen.dart';
import 'package:speeddatingapp/UI/Options/Preferences/Preferences.dart';
import 'package:speeddatingapp/UI/Options/SettingsPageUI.dart';
import 'package:speeddatingapp/UI/PasswordReset/ForgotPassword/forgotPasswordMain.dart';
import 'package:speeddatingapp/UI/Login/loginMain.dart';
import 'package:speeddatingapp/UI/Registration/TermsOfServicePopUp/termsOfService.dart';
import 'package:speeddatingapp/UI/Registration/registrationMain.dart';
import 'package:speeddatingapp/UI/Swiping/Swiping.dart';
import 'package:speeddatingapp/UI/Welcome/WelcomePage.dart';
import 'package:speeddatingapp/homemenu/decision.dart';
import 'package:speeddatingapp/homemenu/navigation.dart';
import '../../UI/Options/Optionmenu.dart';
import '../../navigator/profileScreen.dart';

getRoutes() {
  return {
    Login.route: (context) => const Login(),
    Register.route: (context) => const Register(),
    ForgotPassword.route: (context) => const ForgotPassword(),
    TermsOfServicePopUp.route: (context) => const TermsOfServicePopUp(),
    ProfileScreen.route: (context) => const ProfileScreen(),
    Optionmenu.route: (context) => const Optionmenu(),
    SettingPage.route: (context) => const SettingPage(),
    Preferences.route: (context) => const Preferences(),
    NavigationScreen.route: (context) => const NavigationScreen(),
    WelcomePage.route: (context) => WelcomePage(),
    DecisionPage.route: (context) => const DecisionPage(),
    SwipingPage.route: (context) => const SwipingPage(),
    ChatScreen.route: (context) => const ChatScreen()
  };
}
