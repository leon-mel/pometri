import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speeddatingapp/UI/Welcome/WelcomePage.dart';
import 'package:speeddatingapp/domain/entities/classSizeConfig.dart';
import 'package:speeddatingapp/domain/entities/classDefineColor.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:speeddatingapp/UI/Registration//registrationMain.dart';

import '../../homemenu/landingPage.dart';
import '../PasswordReset/ForgotPassword/forgotPasswordMain.dart';

class LabelLogin extends StatelessWidget {
  const LabelLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: SizeConfig.blockSizeVertical * 6,
        decoration:
            const BoxDecoration(border: Border(bottom: BorderSide(width: 1.5))),
        child: Padding(
          padding: EdgeInsets.only(
              top: SizeConfig.blockSizeVertical,
              left: SizeConfig.blockSizeHorizontal * 3),
          child: Text("Log in",
              style: TextStyle(
                  shadows: const [
                    Shadow(
                        color: Color(0xFF000000),
                        offset: Offset(-1, 1),
                        blurRadius: 3)
                  ],
                  fontWeight: FontWeight.w900,
                  color: const Color(0xFFAAC3FF),
                  fontSize: 3 * SizeConfig.blockSizeVertical)),
        ),
      ),
    );
  }
}

class LabelUsernamePassword extends StatelessWidget {
  const LabelUsernamePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: SizeConfig.blockSizeVertical * 3,
              left: SizeConfig.blockSizeHorizontal * 3),
          child: Text("Username:",
              style: TextStyle(
                  shadows: const [
                    Shadow(
                        color: Color(0xFF000000),
                        offset: Offset(-1, 1),
                        blurRadius: 1)
                  ],
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFFFFFFF),
                  fontSize: 2 * SizeConfig.blockSizeVertical)),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: SizeConfig.blockSizeVertical * 3,
              left: SizeConfig.blockSizeHorizontal * 3),
          child: Text("Password:",
              style: TextStyle(
                  shadows: const [
                    Shadow(
                        color: Color(0xFF000000),
                        offset: Offset(-1, 1),
                        blurRadius: 1)
                  ],
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFFFFFFF),
                  fontSize: 2 * SizeConfig.blockSizeVertical)),
        ),
      ],
    );
  }
}

class TextFieldUsername extends StatefulWidget {
  const TextFieldUsername({Key? key}) : super(key: key);

  @override
  State<TextFieldUsername> createState() => _TextFieldUsernameState();
}

class _TextFieldUsernameState extends State<TextFieldUsername> {
  final FocusNode _focusTextfield = FocusNode();
  Color floatingLabelColor = const Color(0xFF000000);

  @override
  Widget build(BuildContext context) {
    _focusTextfield.addListener(() {
      setState(() {
        floatingLabelColor = _focusTextfield.hasFocus
            ? const Color(0xFFFFFFFF)
            : const Color(0xFF000000);
      });
    });
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 3,
            left: SizeConfig.blockSizeHorizontal * 3,
            right: SizeConfig.blockSizeHorizontal * 3),
        child: Container(
          height: SizeConfig.blockSizeVertical * 5,
          child: TextField(
            focusNode: _focusTextfield,
            enableInteractiveSelection: false,
            enableSuggestions: false,
            autocorrect: false,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9ß ]')),
            ],
            decoration: InputDecoration(
              labelText: "Username",
              hintText: "Please enter your username",
              labelStyle: TextStyle(
                fontSize: 1.75 * SizeConfig.blockSizeVertical,
                fontWeight: FontWeight.bold,
                color: Color(0xFF000000),
              ),
              hintStyle: TextStyle(
                fontSize: 1.75 * SizeConfig.blockSizeVertical,
              ),
              floatingLabelStyle: TextStyle(
                color: floatingLabelColor = _focusTextfield.hasFocus
                    ? const Color(0xFFFFFFFF)
                    : const Color(0xFF000000),
                fontWeight: FontWeight.bold,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    const BorderSide(color: Color(0xFF000000), width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    const BorderSide(color: Color(0xFFFFFFFF), width: 2),
              ),
            ),
            textAlignVertical: const TextAlignVertical(y: 1),
            keyboardType: TextInputType.text,
          ),
        ),
      ),
    );
  }
}

class TextFieldPassword extends StatefulWidget {
  const TextFieldPassword({Key? key}) : super(key: key);

  @override
  State<TextFieldPassword> createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {
  final FocusNode _focusTextfield = FocusNode();
  Color floatingLabelColor = const Color(0xFF000000);
  bool _passwordObscured = true;

  @override
  Widget build(BuildContext context) {
    _focusTextfield.addListener(() {
      setState(() {
        floatingLabelColor = _focusTextfield.hasFocus
            ? const Color(0xFFFFFFFF)
            : const Color(0xFF000000);
      });
    });

    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 2,
            left: SizeConfig.blockSizeHorizontal * 3,
            right: SizeConfig.blockSizeHorizontal * 3),
        child: Container(
          height: SizeConfig.blockSizeVertical * 5,
          child: TextField(
            focusNode: _focusTextfield,
            obscureText: _passwordObscured,
            enableInteractiveSelection: false,
            enableSuggestions: false,
            autocorrect: false,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9ß ]')),
            ],
            decoration: InputDecoration(
              suffixIcon: IconButton(
                alignment: Alignment.centerRight,
                iconSize: SizeConfig.blockSizeVertical * 2.75,
                icon: Icon(
                    _passwordObscured ? Icons.visibility_off : Icons.visibility,
                    color: const Color(0xFF000000)),
                onPressed: () {
                  setState(() {
                    if (_passwordObscured == false) {
                      _passwordObscured = true;
                    } else {
                      _passwordObscured = false;
                    }
                  });
                },
              ),
              labelText: "Password",
              hintText: "Please enter your password",
              labelStyle: TextStyle(
                fontSize: 1.75 * SizeConfig.blockSizeVertical,
                fontWeight: FontWeight.bold,
                color: Color(0xFF000000),
              ),
              hintStyle: TextStyle(
                fontSize: 1.75 * SizeConfig.blockSizeVertical,
              ),
              floatingLabelStyle: TextStyle(
                color: floatingLabelColor = _focusTextfield.hasFocus
                    ? const Color(0xFFFFFFFF)
                    : const Color(0xFF000000),
                fontWeight: FontWeight.bold,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    const BorderSide(color: Color(0xFF000000), width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    const BorderSide(color: Color(0xFFFFFFFF), width: 2),
              ),
            ),
            textAlignVertical: const TextAlignVertical(y: 1),
            keyboardType: TextInputType.text,
          ),
        ),
      ),
    );
  }
}

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
      child: Material(
        color: const Color(0xFF666666),
        borderRadius: BorderRadius.circular(50),
        child: Bounce(
          onPressed: () {
            Navigator.popAndPushNamed(context, WelcomePage.route);
          },
          duration: const Duration(milliseconds: 125),
          child: Container(
            height: SizeConfig.blockSizeVertical * 6,
            width: SizeConfig.blockSizeHorizontal * 60,
            child: Center(
                child: Text("Login",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 3 * SizeConfig.blockSizeVertical))),
            decoration: BoxDecoration(
              color: const Color(0xFFE6E6E6),
              border: Border.all(),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ),
    );
  }
}

class LabelNewAccount extends StatefulWidget {
  const LabelNewAccount({Key? key}) : super(key: key);

  @override
  State<LabelNewAccount> createState() => _LabelNewAccountState();
}

class _LabelNewAccountState extends State<LabelNewAccount> {
  Color useColor = const Color(0xFF7FFFAB);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 4),
        child: Column(children: [
          Container(
            decoration: const BoxDecoration(
                border: Border(top: BorderSide(width: 1.5))),
          ),
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 4.5),
            child: Center(
              child: Container(
                color: Colors.transparent,
                height: SizeConfig.blockSizeVertical * 6,
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        useColor = defColor(1);
                      });
                      Future.delayed(const Duration(milliseconds: 200), () {
                        setState(() {
                          useColor = defColor(0);
                        });
                      });
                      Future.delayed(const Duration(milliseconds: 300), () {
                        setState(() {
                          Navigator.pushNamed(context, Register.route);
                        });
                      });
                    },
                    style: const ButtonStyle(
                        splashFactory: NoSplash.splashFactory,
                        enableFeedback: false),
                    child: AnimatedContainer(
                      duration: const Duration(microseconds: 0),
                      child: Text("Create new account",
                          style: TextStyle(
                              shadows: [
                                Shadow(
                                    color: useColor,
                                    offset: const Offset(0, -3))
                              ],
                              color: Colors.transparent,
                              decoration: TextDecoration.underline,
                              decorationColor: useColor,
                              decorationThickness: 3,
                              fontSize: 1.5 * SizeConfig.blockSizeVertical,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class LabelForgotPassword extends StatefulWidget {
  const LabelForgotPassword({Key? key}) : super(key: key);

  @override
  State<LabelForgotPassword> createState() => _LabelForgotPasswordState();
}

class _LabelForgotPasswordState extends State<LabelForgotPassword> {
  Color useColor = const Color(0xFF7FFFAB);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
      child: Center(
        child: Container(
          color: Colors.transparent,
          height: SizeConfig.blockSizeVertical * 6,
          child: Center(
            child: TextButton(
              onPressed: () {
                setState(() {
                  useColor = defColor(1);
                });
                Future.delayed(const Duration(milliseconds: 200), () {
                  setState(() {
                    useColor = defColor(0);
                  });
                });
                Future.delayed(const Duration(milliseconds: 300), () {
                  setState(() {
                    Navigator.pushNamed(context, ForgotPassword.route);
                  });
                });
              },
              style: const ButtonStyle(
                  splashFactory: NoSplash.splashFactory, enableFeedback: false),
              child: AnimatedContainer(
                duration: const Duration(microseconds: 0),
                child: Text(
                  "Forgot your password?",
                  style: TextStyle(
                      shadows: [Shadow(color: useColor, offset: Offset(0, -3))],
                      color: Colors.transparent,
                      decoration: TextDecoration.underline,
                      decorationColor: useColor,
                      decorationThickness: 3,
                      fontSize: 1.5 * SizeConfig.blockSizeVertical,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
