import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speeddatingapp/Classes/classSizeConfig.dart';
import 'forgotPasswordContainerBody.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);
  static String route = "ForgotPassword";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF666666),
          title: Text("Password recovery", style: TextStyle(color: Color(0xFFFFFFFF), fontSize: SizeConfig.blockSizeVertical * 3)),
          elevation: 16,
        ),
      body: Material(

        child: Padding(
          padding: EdgeInsets.only(
              top: SizeConfig.blockSizeVertical * 5, left: SizeConfig.blockSizeHorizontal * 5, right: SizeConfig.blockSizeHorizontal * 5),
          child: Container(
            height: SizeConfig.blockSizeVertical * 25,
            width: SizeConfig.blockSizeHorizontal * 90,
            decoration: BoxDecoration(
                color: Color(0xFF666666), border: Border.all(color: Color(0xFF000000), width: 1.5), borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                Row(
                  children: [TextFieldMail()],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ResetPassword(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ReturnToLogin(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    )    ;


  }
}

