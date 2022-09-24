import 'package:flutter/material.dart';
import 'package:speeddatingapp/UI/Login/loginContainerBody.dart';
import 'package:speeddatingapp/Classes/classSizeConfig.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
  static String route = "Login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6E6E6),
       resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Icon(Icons.favorite, color: Color(0xFFFF0000), size: SizeConfig.blockSizeVertical * 3),
        backgroundColor: Color(0xFF666666),
        title: Text("Pometri", style: TextStyle(color: Color(0xFFFFFFFF), fontSize: SizeConfig.blockSizeVertical * 3)),
        elevation: 16,
      ),
      body: Center(
          child: Material(
            borderRadius: BorderRadius.circular(12),
            elevation: 16,
            child: Container(
              height: SizeConfig.blockSizeVertical * 60,
              width: SizeConfig.blockSizeHorizontal * 80,
              decoration: BoxDecoration(
                  color: Color(0xFF666666), border: Border.all(color: Color(0xFF000000), width: 1.5), borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  Row(
                    children: [LabelLogin()],
                  ),
                  Row(
                    children: [TextFieldUsername(),
                    ],
                  ),
                  Row(
                    children: [TextFieldPassword(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [LabelForgotPassword()],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [ButtonLogin()],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [LabelNewAccount()],
                  ),
                ],
              ),
            ),
          ),
    ),
    )    ;
  }
}
