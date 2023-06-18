import 'package:flutter/material.dart';
import 'package:speeddatingapp/domain/entities/classSizeConfig.dart';

class TermsOfServicePopUp extends StatelessWidget {
  const TermsOfServicePopUp({Key? key}) : super(key: key);
  static String route = "TermsOfServicePopUp";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF666666),
          title: Text("Terms of service",
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
                  height: SizeConfig.blockSizeVertical * 80,
                  width: SizeConfig.blockSizeHorizontal * 90,
                  decoration: BoxDecoration(
                      color: const Color(0xFF666666),
                      border: Border.all(color: const Color(0xFF000000), width: 1.5),
                      borderRadius: BorderRadius.circular(12)),
                  child: const Column(children: []),
                ),
              ),
            )));
  }
}
