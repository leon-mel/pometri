import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../Classes/classSizeConfig.dart';


class TextFieldMail extends StatefulWidget {
  const TextFieldMail({Key? key}) : super(key: key);

  @override
  State<TextFieldMail> createState() => _TextFieldMailState();
}

class _TextFieldMailState extends State<TextFieldMail> {
  final FocusNode _focusTextfield = FocusNode();
  Color floatingLabelColor = const Color(0xFF000000);

  @override
  Widget build(BuildContext context) {
    _focusTextfield.addListener(() {
      setState(() {
        floatingLabelColor = _focusTextfield.hasFocus ? const Color(0xFFFFFFFF) : const Color(0xFF000000);
      });
    });
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 1.5, left: SizeConfig.blockSizeHorizontal * 3, right: SizeConfig.blockSizeHorizontal * 3),
        child: Container(
          height: SizeConfig.blockSizeVertical * 5,
          child: TextField(
            focusNode: _focusTextfield,
            enableInteractiveSelection: false,
            enableSuggestions: false,
            autocorrect: false,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9ß @.]')),
            ],
            decoration: InputDecoration(
              labelText: "E-Mail address",
              hintText: "Please enter your E-Mail address",
              labelStyle: TextStyle(
                fontSize: 1.75 * SizeConfig.blockSizeVertical,
                fontWeight: FontWeight.bold,
                color: Color(0xFF000000),
              ),
              hintStyle: TextStyle(
                fontSize: 1.75 * SizeConfig.blockSizeVertical,
              ),
              floatingLabelStyle: TextStyle(
                color: floatingLabelColor = _focusTextfield.hasFocus ? const Color(0xFFFFFFFF) : const Color(0xFF000000),
                fontWeight: FontWeight.bold,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFF000000), width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFFFFFFF), width: 2),
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

class ReturnToLogin extends StatelessWidget {
  const ReturnToLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical * 1.5, left: SizeConfig.blockSizeHorizontal * 5, right: SizeConfig.blockSizeHorizontal * 5),
      child: Center(
              child: Container(
                height: SizeConfig.blockSizeVertical * 5,
                width: SizeConfig.blockSizeHorizontal * 50,
                child: ElevatedButton(
            onPressed: () {
                Navigator.pop(context);
            },
            child: Text("Back to Login", style: TextStyle(color: Color(0xFF000000),fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Color(0xFF000000)),
                    primary: Color(0xFFE6E6E6),
                  ),
          ),
              )),
    );
  }
}

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical * 2, left: SizeConfig.blockSizeHorizontal * 5, right: SizeConfig.blockSizeHorizontal * 5),
      child: Center(
          child: Container(
            height: SizeConfig.blockSizeVertical * 5,
            width: SizeConfig.blockSizeHorizontal * 50,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ElevatedButton.icon(
                onPressed: () {
                  Widget okButton = TextButton(
                    child: Text("OK", style: TextStyle(fontWeight: FontWeight.bold)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  );
                  AlertDialog alert = AlertDialog(
                    title: Text("Notification"),
                    content: Text("An E-Mail has been sent to reset your password."),
                      actions: [
                        okButton
                      ]
                  );
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                },
                icon: Icon(Icons.key,color: Color(0xFF000000)),
                label: Text("Reset password", style: TextStyle(color: Color(0xFF000000),fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Color(0xFF000000)),
                  primary: Color(0xFFE6E6E6),
                ),
              ),
            ),
          )),
    );
  }
}