import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speeddatingapp/UI/Login/loginContainerBody.dart';
import 'package:speeddatingapp/domain/entities/classSizeConfig.dart';
import 'package:speeddatingapp/injection.dart';
import 'bloc/sign_up_bloc.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
  static String route = "Login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6E6E6),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Icon(Icons.favorite,
            color: const Color(0xFFFF0000), size: SizeConfig.blockSizeVertical * 3),
        backgroundColor: const Color(0xFF666666),
        title: Text("Pometri",
            style: TextStyle(
                color: const Color(0xFFFFFFFF),
                fontSize: SizeConfig.blockSizeVertical * 3)),
        elevation: 16,
      ),
      body: BlocProvider(
        create: (context) => sl<SignUpBloc>(),
        child: Center(
          child: Material(
            borderRadius: BorderRadius.circular(12),
            elevation: 16,
            child: Container(
              height: SizeConfig.blockSizeVertical * 60,
              width: SizeConfig.blockSizeHorizontal * 80,
              decoration: BoxDecoration(
                  color: const Color(0xFF666666),
                  border: Border.all(color: const Color(0xFF000000), width: 1.5),
                  borderRadius: BorderRadius.circular(12)),
              child: const Column(
                children: [
                  Row(
                    children: [LabelLogin()],
                  ),
                  Row(
                    children: [TextFieldUsername()],
                  ),
                  Row(
                    children: [TextFieldPassword()],
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
                    children: [LabelWrongUserdata()],
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
      ),
    );
  }
}
