import 'package:flutter/material.dart';
import 'package:speeddatingapp/domain/entities/classSizeConfig.dart';
import 'package:speeddatingapp/UI/Registration/registrationContainerBody.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);
  static String route = "Registration";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF666666),
          title: Text("Registration",
              style: TextStyle(
                  color: const Color(0xFFFFFFFF),
                  fontSize: SizeConfig.blockSizeVertical * 3)),
          elevation: 16,
        ),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Material(
              child: Padding(
                padding: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 5,
                    left: SizeConfig.blockSizeHorizontal * 5,
                    right: SizeConfig.blockSizeHorizontal * 5,
                    bottom: SizeConfig.blockSizeHorizontal * 10),
                child: Container(
                  height: SizeConfig.blockSizeVertical * 130,
                  width: SizeConfig.blockSizeHorizontal * 90,
                  decoration: BoxDecoration(
                      color: const Color(0xFF666666),
                      border: Border.all(color: const Color(0xFF000000), width: 1.5),
                      borderRadius: BorderRadius.circular(12)),
                  child: const Column(children: [
                    Row(
                      children: [TextFieldRegUsername()],
                    ),
                    Row(
                      children: [TextFieldRegPassword()],
                    ),
                    Row(
                      children: [TextFieldRegPasswordTwo()],
                    ),
                    Row(
                      children: [TextFieldRegFirstName()],
                    ),
                    Row(
                      children: [TextFieldRegLastName()],
                    ),
                    Row(
                      children: [TextFieldRegBirthDate()],
                    ),
                    Row(
                      children: [DropDownButtonRegGender()],
                    ),
                    Row(
                      children: [TextFieldRegMail()],
                    ),
                    Row(
                      children: [TextFieldRegMobNumber()],
                    ),
                    Row(
                      children: [TextFieldRegStreetAddress()],
                    ),
                    Row(
                      children: [TextFieldRegAddressNumber()],
                    ),
                    Row(
                      children: [TextFieldRegCity()],
                    ),
                    Row(
                      children: [TextFieldRegPostCode()],
                    ),
                    Row(
                      children: [TextFieldRegCountry()],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ButtonRegTermsOfService()],
                    ),
                    /*Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [RegistrationButton()],
                    ),*/
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ReturnToLoginRegButton()],
                    ),
                  ]),
                ),
              ),
            )));
  }
}
