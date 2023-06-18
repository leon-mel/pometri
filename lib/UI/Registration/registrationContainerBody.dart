import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speeddatingapp/domain/entities/classSizeConfig.dart';
import 'package:intl/intl.dart';

class TextFieldRegUsername extends StatefulWidget {
  const TextFieldRegUsername({Key? key}) : super(key: key);

  @override
  State<TextFieldRegUsername> createState() => _TextFieldRegUsernameState();
}

class _TextFieldRegUsernameState extends State<TextFieldRegUsername> {
  final FocusNode _focusTextfield = FocusNode();
  Color floatingLabelColor = const Color(0xFF000000);
  final TextEditingController _username = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _focusTextfield.addListener(() {
      setState(() {
        floatingLabelColor = _focusTextfield.hasFocus
            ? const Color(0xFFFFFFFF)
            : const Color(0xFF000000);
        floatingLabelColor = _focusTextfield.hasFocus
            ? const Color(0xFFFFFFFF)
            : const Color(0xFF7FFFAB);
      });
    });
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 3,
            left: SizeConfig.blockSizeHorizontal * 3,
            right: SizeConfig.blockSizeHorizontal * 3),
        child: SizedBox(
          height: SizeConfig.blockSizeVertical * 5,
          child: TextField(
            focusNode: _focusTextfield,
            enableInteractiveSelection: false,
            enableSuggestions: false,
            autocorrect: false,
            controller: _username,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9ß ]')),
            ],
            decoration: InputDecoration(
              labelText: "Username",
              hintText: "Please enter your chosen username",
              labelStyle: TextStyle(
                fontSize: 1.75 * SizeConfig.blockSizeVertical,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF000000),
              ),
              hintStyle: TextStyle(
                fontSize: 1.75 * SizeConfig.blockSizeVertical,
              ),
              floatingLabelStyle: TextStyle(
                color: floatingLabelColor,
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

class TextFieldRegPassword extends StatefulWidget {
  const TextFieldRegPassword({Key? key}) : super(key: key);

  @override
  State<TextFieldRegPassword> createState() => _TextFieldRegPasswordState();
}

class _TextFieldRegPasswordState extends State<TextFieldRegPassword> {
  final FocusNode _focusTextfield = FocusNode();
  Color floatingLabelColor = const Color(0xFF000000);
  bool _passwordObscured = true;
  TextEditingController passwordOne = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _focusTextfield.addListener(() {
      setState(() {
        floatingLabelColor = _focusTextfield.hasFocus
            ? const Color(0xFFFFFFFF)
            : const Color(0xFF000000);
        floatingLabelColor = _focusTextfield.hasFocus
            ? const Color(0xFFFFFFFF)
            : const Color(0xFF7FFFAB);
      });
    });

    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 2,
            left: SizeConfig.blockSizeHorizontal * 3,
            right: SizeConfig.blockSizeHorizontal * 3),
        child: SizedBox(
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
              hintText: "Please enter your chosen password",
              labelStyle: TextStyle(
                fontSize: 1.75 * SizeConfig.blockSizeVertical,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF000000),
              ),
              hintStyle: TextStyle(
                fontSize: 1.75 * SizeConfig.blockSizeVertical,
              ),
              floatingLabelStyle: TextStyle(
                color: floatingLabelColor,
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

class TextFieldRegPasswordTwo extends StatefulWidget {
  const TextFieldRegPasswordTwo({Key? key}) : super(key: key);

  @override
  State<TextFieldRegPasswordTwo> createState() =>
      _TextFieldRegPasswordTwoState();
}

class _TextFieldRegPasswordTwoState extends State<TextFieldRegPasswordTwo> {
  final FocusNode _focusTextfield = FocusNode();
  Color floatingLabelColor = const Color(0xFF000000);
  bool _passwordObscured = true;
  final TextEditingController passwordTwo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _focusTextfield.addListener(() {
      setState(() {
        floatingLabelColor = _focusTextfield.hasFocus
            ? const Color(0xFFFFFFFF)
            : const Color(0xFF000000);
        floatingLabelColor = _focusTextfield.hasFocus
            ? const Color(0xFFFFFFFF)
            : const Color(0xFF7FFFAB);
      });
    });

    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 2,
            left: SizeConfig.blockSizeHorizontal * 3,
            right: SizeConfig.blockSizeHorizontal * 3),
        child: SizedBox(
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
              labelText: "Password confirmation",
              hintText: "Please reenter your chosen password",
              labelStyle: TextStyle(
                fontSize: 1.75 * SizeConfig.blockSizeVertical,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF000000),
              ),
              hintStyle: TextStyle(
                fontSize: 1.75 * SizeConfig.blockSizeVertical,
              ),
              floatingLabelStyle: TextStyle(
                color: floatingLabelColor,
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

class TextFieldRegFirstName extends StatefulWidget {
  const TextFieldRegFirstName({Key? key}) : super(key: key);

  @override
  State<TextFieldRegFirstName> createState() => _TextFieldRegFirstNameState();
}

class _TextFieldRegFirstNameState extends State<TextFieldRegFirstName> {
  final FocusNode _focusTextfield = FocusNode();
  Color floatingLabelColor = const Color(0xFF000000);
  final TextEditingController _firstName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _focusTextfield.addListener(() {
      setState(() {
        floatingLabelColor = _focusTextfield.hasFocus
            ? const Color(0xFFFFFFFF)
            : const Color(0xFF000000);
        floatingLabelColor = _focusTextfield.hasFocus
            ? const Color(0xFFFFFFFF)
            : const Color(0xFF7FFFAB);
      });
    });
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 4,
            left: SizeConfig.blockSizeHorizontal * 3,
            right: SizeConfig.blockSizeHorizontal * 3),
        child: SizedBox(
          height: SizeConfig.blockSizeVertical * 5,
          child: TextField(
            focusNode: _focusTextfield,
            enableInteractiveSelection: false,
            enableSuggestions: false,
            autocorrect: false,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[a-zA-Zß ]')),
            ],
            decoration: InputDecoration(
              labelText: "First name",
              hintText: "Please enter your first name",
              labelStyle: TextStyle(
                fontSize: 1.75 * SizeConfig.blockSizeVertical,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF000000),
              ),
              hintStyle: TextStyle(
                fontSize: 1.75 * SizeConfig.blockSizeVertical,
              ),
              floatingLabelStyle: TextStyle(
                color: floatingLabelColor,
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

class TextFieldRegLastName extends StatefulWidget {
  const TextFieldRegLastName({Key? key}) : super(key: key);

  @override
  State<TextFieldRegLastName> createState() => _TextFieldRegLastNameState();
}

class _TextFieldRegLastNameState extends State<TextFieldRegLastName> {
  final FocusNode _focusTextfield = FocusNode();
  Color floatingLabelColor = const Color(0xFF000000);
  final TextEditingController _lastName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _focusTextfield.addListener(() {
      setState(() {
        floatingLabelColor = _focusTextfield.hasFocus
            ? const Color(0xFFFFFFFF)
            : const Color(0xFF000000);
        floatingLabelColor = _focusTextfield.hasFocus
            ? const Color(0xFFFFFFFF)
            : const Color(0xFF7FFFAB);
      });
    });
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 2,
            left: SizeConfig.blockSizeHorizontal * 3,
            right: SizeConfig.blockSizeHorizontal * 3),
        child: SizedBox(
          height: SizeConfig.blockSizeVertical * 5,
          child: TextField(
            focusNode: _focusTextfield,
            enableInteractiveSelection: false,
            enableSuggestions: false,
            autocorrect: false,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[a-zA-Zß ]')),
            ],
            decoration: InputDecoration(
              labelText: "Last name",
              hintText: "Please enter your last name",
              labelStyle: TextStyle(
                fontSize: 1.75 * SizeConfig.blockSizeVertical,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF000000),
              ),
              hintStyle: TextStyle(
                fontSize: 1.75 * SizeConfig.blockSizeVertical,
              ),
              floatingLabelStyle: TextStyle(
                color: floatingLabelColor,
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

class TextFieldRegBirthDate extends StatefulWidget {
  const TextFieldRegBirthDate({Key? key}) : super(key: key);

  @override
  State<TextFieldRegBirthDate> createState() => _TextFieldRegBirthDateState();
}

class _TextFieldRegBirthDateState extends State<TextFieldRegBirthDate> {
  final FocusNode _focusTextfield = FocusNode();
  Color floatingLabelColor = const Color(0xFF000000);
  DateTime date = DateTime.now();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _date2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _focusTextfield.addListener(() {
      setState(() {
        floatingLabelColor = _focusTextfield.hasFocus
            ? const Color(0xFFFFFFFF)
            : const Color(0xFF000000);
        floatingLabelColor = _focusTextfield.hasFocus
            ? const Color(0xFFFFFFFF)
            : const Color(0xFF7FFFAB);
      });
    });
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 2,
            left: SizeConfig.blockSizeHorizontal * 3,
            right: SizeConfig.blockSizeHorizontal * 3),
        child: SizedBox(
          height: SizeConfig.blockSizeVertical * 5,
          child: TextField(
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now());
              if (pickedDate == null) {
                FocusScope.of(context).requestFocus(FocusNode());
                return;
              }
              setState(() {
                _date.text = DateFormat('yyyy-MM-dd').format(pickedDate);
                FocusScope.of(context).requestFocus(FocusNode());
              });
            },
            focusNode: _focusTextfield,
            enableInteractiveSelection: false,
            enableSuggestions: false,
            autocorrect: false,
            readOnly: true,
            controller: _date,
            decoration: InputDecoration(
              labelText: "Date of birth",
              hintText: "YYYY/MM/DD",
              labelStyle: TextStyle(
                fontSize: 1.75 * SizeConfig.blockSizeVertical,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF000000),
              ),
              hintStyle: TextStyle(
                fontSize: 1.75 * SizeConfig.blockSizeVertical,
              ),
              floatingLabelStyle: TextStyle(
                color: floatingLabelColor,
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
          ),
        ),
      ),
    );
  }
}

class DropDownButtonRegGender extends StatefulWidget {
  const DropDownButtonRegGender({Key? key}) : super(key: key);

  @override
  State<DropDownButtonRegGender> createState() =>
      _DropDownButtonRegGenderState();
}

class _DropDownButtonRegGenderState extends State<DropDownButtonRegGender> {
  String? _hintValue;
  String dropdownValue = 'Male';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 2,
            left: SizeConfig.blockSizeHorizontal * 3,
            right: SizeConfig.blockSizeHorizontal * 3),
        child: Container(
          height: SizeConfig.blockSizeVertical * 5,
          decoration: BoxDecoration(
              color: const Color(0xFF666666),
              border: Border.all(color: const Color(0xFF000000), width: 1),
              borderRadius: BorderRadius.circular(12)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: Padding(
                padding:
                    EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 3),
                child: Text("Gender",
                    style: TextStyle(
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.bold,
                        fontSize: 1.75 * SizeConfig.blockSizeVertical)),
              ),
              value: _hintValue,
              style: const TextStyle(color: Color(0xFF000000)),
              onChanged: (String? newValue) {
                setState(() {
                  _hintValue = newValue ?? "";
                });
              },
              items: <String>['Male', 'Female', 'Miscellaneous']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 3),
                    child: Text(value,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 1.75 * SizeConfig.blockSizeVertical)),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldRegMail extends StatefulWidget {
  const TextFieldRegMail({Key? key}) : super(key: key);

  @override
  State<TextFieldRegMail> createState() => _TextFieldRegMailState();
}

class _TextFieldRegMailState extends State<TextFieldRegMail> {
  final FocusNode _focusTextfield = FocusNode();
  Color floatingLabelColor = const Color(0xFF000000);
  final TextEditingController _mail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _focusTextfield.addListener(() {
      setState(() {
        floatingLabelColor = _focusTextfield.hasFocus
            ? const Color(0xFFFFFFFF)
            : const Color(0xFF000000);
        floatingLabelColor = _focusTextfield.hasFocus
            ? const Color(0xFFFFFFFF)
            : const Color(0xFF7FFFAB);
      });
    });
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 4,
            left: SizeConfig.blockSizeHorizontal * 3,
            right: SizeConfig.blockSizeHorizontal * 3),
        child: SizedBox(
          height: SizeConfig.blockSizeVertical * 5,
          child: TextField(
            focusNode: _focusTextfield,
            enableInteractiveSelection: false,
            enableSuggestions: false,
            autocorrect: false,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[a-zA-Zß @]')),
            ],
            decoration: InputDecoration(
              labelText: "E-Mail address",
              hintText: "Please enter your E-Mail address",
              labelStyle: TextStyle(
                fontSize: 1.75 * SizeConfig.blockSizeVertical,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF000000),
              ),
              hintStyle: TextStyle(
                fontSize: 1.75 * SizeConfig.blockSizeVertical,
              ),
              floatingLabelStyle: TextStyle(
                color: floatingLabelColor,
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

class TextFieldRegMobNumber extends StatefulWidget {
  const TextFieldRegMobNumber({Key? key}) : super(key: key);

  @override
  State<TextFieldRegMobNumber> createState() => _TextFieldRegMobNumberState();
}

class _TextFieldRegMobNumberState extends State<TextFieldRegMobNumber> {
  final FocusNode _focusTextfield = FocusNode();
  Color floatingLabelColor = const Color(0xFF000000);
  final TextEditingController _mobNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _focusTextfield.addListener(() {
      setState(() {
        floatingLabelColor = _focusTextfield.hasFocus
            ? const Color(0xFFFFFFFF)
            : const Color(0xFF000000);
        floatingLabelColor = _focusTextfield.hasFocus
            ? const Color(0xFFFFFFFF)
            : const Color(0xFF7FFFAB);
      });
    });
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 2,
            left: SizeConfig.blockSizeHorizontal * 3,
            right: SizeConfig.blockSizeHorizontal * 3),
        child: SizedBox(
          height: SizeConfig.blockSizeVertical * 5,
          child: TextField(
            focusNode: _focusTextfield,
            enableInteractiveSelection: false,
            enableSuggestions: false,
            autocorrect: false,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
            ],
            decoration: InputDecoration(
              labelText: "Mobile number",
              hintText: "Please enter your mobile number",
              labelStyle: TextStyle(
                fontSize: 1.75 * SizeConfig.blockSizeVertical,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF000000),
              ),
              hintStyle: TextStyle(
                fontSize: 1.75 * SizeConfig.blockSizeVertical,
              ),
              floatingLabelStyle: TextStyle(
                color: floatingLabelColor,
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

class TextFieldRegStreetAddress extends StatefulWidget {
  const TextFieldRegStreetAddress({Key? key}) : super(key: key);

  @override
  State<TextFieldRegStreetAddress> createState() =>
      _TextFieldRegStreetAddressState();
}

class _TextFieldRegStreetAddressState extends State<TextFieldRegStreetAddress> {
  final FocusNode _focusTextfield = FocusNode();
  Color floatingLabelColor = const Color(0xFF000000);
  final TextEditingController _streetAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _focusTextfield.addListener(() {
      setState(() {
        floatingLabelColor = _focusTextfield.hasFocus
            ? const Color(0xFFFFFFFF)
            : const Color(0xFF000000);
        floatingLabelColor = _focusTextfield.hasFocus
            ? const Color(0xFFFFFFFF)
            : const Color(0xFF7FFFAB);
      });
    });
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 2,
            left: SizeConfig.blockSizeHorizontal * 3,
            right: SizeConfig.blockSizeHorizontal * 3),
        child: SizedBox(
          height: SizeConfig.blockSizeVertical * 5,
          child: TextField(
            focusNode: _focusTextfield,
            enableInteractiveSelection: false,
            enableSuggestions: false,
            autocorrect: false,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[a-zA-Zß ]')),
            ],
            decoration: InputDecoration(
              labelText: "Street address",
              hintText: "Please enter your street address",
              labelStyle: TextStyle(
                fontSize: 1.75 * SizeConfig.blockSizeVertical,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF000000),
              ),
              hintStyle: TextStyle(
                fontSize: 1.75 * SizeConfig.blockSizeVertical,
              ),
              floatingLabelStyle: TextStyle(
                color: floatingLabelColor,
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

class TextFieldRegAddressNumber extends StatefulWidget {
  const TextFieldRegAddressNumber({Key? key}) : super(key: key);

  @override
  State<TextFieldRegAddressNumber> createState() =>
      _TextFieldRegAddressNumberState();
}

class _TextFieldRegAddressNumberState extends State<TextFieldRegAddressNumber> {
  final FocusNode _focusTextfield = FocusNode();
  Color floatingLabelColor = const Color(0xFF000000);
  final TextEditingController _addressNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _focusTextfield.addListener(() {
      setState(() {
        floatingLabelColor = _focusTextfield.hasFocus
            ? const Color(0xFFFFFFFF)
            : const Color(0xFF000000);
        floatingLabelColor = _focusTextfield.hasFocus
            ? const Color(0xFFFFFFFF)
            : const Color(0xFF7FFFAB);
      });
    });
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 2,
            left: SizeConfig.blockSizeHorizontal * 3,
            right: SizeConfig.blockSizeHorizontal * 3),
        child: SizedBox(
          height: SizeConfig.blockSizeVertical * 5,
          child: TextField(
            focusNode: _focusTextfield,
            enableInteractiveSelection: false,
            enableSuggestions: false,
            autocorrect: false,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
            ],
            decoration: InputDecoration(
              labelText: "Address number",
              hintText: "Please enter your address number",
              labelStyle: TextStyle(
                fontSize: 1.75 * SizeConfig.blockSizeVertical,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF000000),
              ),
              hintStyle: TextStyle(
                fontSize: 1.75 * SizeConfig.blockSizeVertical,
              ),
              floatingLabelStyle: TextStyle(
                color: floatingLabelColor,
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

class TextFieldRegCity extends StatefulWidget {
  const TextFieldRegCity({Key? key}) : super(key: key);

  @override
  State<TextFieldRegCity> createState() => _TextFieldRegCityState();
}

class _TextFieldRegCityState extends State<TextFieldRegCity> {
  final FocusNode _focusTextfield = FocusNode();
  Color floatingLabelColor = const Color(0xFF000000);
  final TextEditingController _city = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _focusTextfield.addListener(() {
      setState(() {
        floatingLabelColor = _focusTextfield.hasFocus
            ? const Color(0xFFFFFFFF)
            : const Color(0xFF000000);
        floatingLabelColor = _focusTextfield.hasFocus
            ? const Color(0xFFFFFFFF)
            : const Color(0xFF7FFFAB);
      });
    });
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 2,
            left: SizeConfig.blockSizeHorizontal * 3,
            right: SizeConfig.blockSizeHorizontal * 3),
        child: SizedBox(
          height: SizeConfig.blockSizeVertical * 5,
          child: TextField(
            focusNode: _focusTextfield,
            enableInteractiveSelection: false,
            enableSuggestions: false,
            autocorrect: false,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[a-zA-Zß ]')),
            ],
            decoration: InputDecoration(
              labelText: "City",
              hintText: "Please enter the city where you live",
              labelStyle: TextStyle(
                fontSize: 1.75 * SizeConfig.blockSizeVertical,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF000000),
              ),
              hintStyle: TextStyle(
                fontSize: 1.75 * SizeConfig.blockSizeVertical,
              ),
              floatingLabelStyle: TextStyle(
                color: floatingLabelColor,
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

class TextFieldRegPostCode extends StatefulWidget {
  const TextFieldRegPostCode({Key? key}) : super(key: key);

  @override
  State<TextFieldRegPostCode> createState() => _TextFieldRegPostCodeState();
}

class _TextFieldRegPostCodeState extends State<TextFieldRegPostCode> {
  final FocusNode _focusTextfield = FocusNode();
  Color floatingLabelColor = const Color(0xFF000000);
  final TextEditingController _city = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _focusTextfield.addListener(() {
      setState(() {
        floatingLabelColor = _focusTextfield.hasFocus
            ? const Color(0xFFFFFFFF)
            : const Color(0xFF000000);
        floatingLabelColor = _focusTextfield.hasFocus
            ? const Color(0xFFFFFFFF)
            : const Color(0xFF7FFFAB);
      });
    });
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 2,
            left: SizeConfig.blockSizeHorizontal * 3,
            right: SizeConfig.blockSizeHorizontal * 3),
        child: SizedBox(
          height: SizeConfig.blockSizeVertical * 5,
          child: TextField(
            focusNode: _focusTextfield,
            enableInteractiveSelection: false,
            enableSuggestions: false,
            autocorrect: false,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
            ],
            decoration: InputDecoration(
              labelText: "Post code",
              hintText: "Please enter your post code",
              labelStyle: TextStyle(
                fontSize: 1.75 * SizeConfig.blockSizeVertical,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF000000),
              ),
              hintStyle: TextStyle(
                fontSize: 1.75 * SizeConfig.blockSizeVertical,
              ),
              floatingLabelStyle: TextStyle(
                color: floatingLabelColor,
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

class TextFieldRegCountry extends StatefulWidget {
  const TextFieldRegCountry({Key? key}) : super(key: key);

  @override
  State<TextFieldRegCountry> createState() => _TextFieldRegCountryState();
}

class _TextFieldRegCountryState extends State<TextFieldRegCountry> {
  final FocusNode _focusTextfield = FocusNode();
  Color floatingLabelColor = const Color(0xFF000000);
  final TextEditingController _country = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _focusTextfield.addListener(() {
      setState(() {
        floatingLabelColor = _focusTextfield.hasFocus
            ? const Color(0xFFFFFFFF)
            : const Color(0xFF000000);
        floatingLabelColor = _focusTextfield.hasFocus
            ? const Color(0xFFFFFFFF)
            : const Color(0xFF7FFFAB);
      });
    });
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 2,
            left: SizeConfig.blockSizeHorizontal * 3,
            right: SizeConfig.blockSizeHorizontal * 3),
        child: SizedBox(
          height: SizeConfig.blockSizeVertical * 5,
          child: TextField(
            focusNode: _focusTextfield,
            enableInteractiveSelection: false,
            enableSuggestions: false,
            autocorrect: false,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[a-zA-Zß ]')),
            ],
            decoration: InputDecoration(
              labelText: "Country",
              hintText: "Please enter the country you live in",
              labelStyle: TextStyle(
                fontSize: 1.75 * SizeConfig.blockSizeVertical,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF000000),
              ),
              hintStyle: TextStyle(
                fontSize: 1.75 * SizeConfig.blockSizeVertical,
              ),
              floatingLabelStyle: TextStyle(
                color: floatingLabelColor,
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

class ButtonRegTermsOfService extends StatelessWidget {
  const ButtonRegTermsOfService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical * 3,
          left: SizeConfig.blockSizeHorizontal * 5,
          right: SizeConfig.blockSizeHorizontal * 5),
      child: Center(
          child: SizedBox(
        height: SizeConfig.blockSizeVertical * 5,
        width: SizeConfig.blockSizeHorizontal * 50,
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Datenschutzerklärung'),
                content: const SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                      fontFamily: 'Roboto',
                      letterSpacing: 3,
                      wordSpacing: 3,
                    ),
                  ),
                ),
                actions: [
                  TextButton(
                    child: const Text('Annehmen',
                        style: TextStyle(color: Colors.green)),
                    onPressed: () => Navigator.pop(context),
                  ),
                  TextButton(
                    child: const Text('Ablehnen',
                        style: TextStyle(color: Colors.red)),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            );
          },
          child: const Text("Terms of Service",
              style: TextStyle(
                  color: Color(0xFF000000), fontWeight: FontWeight.bold)),
          style: ElevatedButton.styleFrom(
            side: const BorderSide(color: Color(0xFF000000)), backgroundColor: const Color(0xFFE6E6E6),
          ),
        ),
      )),
    );
  }
}

class RegistrationButton extends StatelessWidget {
  const RegistrationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical * 2,
          left: SizeConfig.blockSizeHorizontal * 5,
          right: SizeConfig.blockSizeHorizontal * 5),
      child: Center(
          child: SizedBox(
        height: SizeConfig.blockSizeVertical * 5,
        width: SizeConfig.blockSizeHorizontal * 50,
        child: ElevatedButton(
          onPressed: () {
            Widget okButton = TextButton(
              child: const Text("OK", style: TextStyle(fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.pop(context);
              },
            );
            AlertDialog alert = AlertDialog(
                title: const Text("Notification"),
                content: const Text("Your account creation was successful."),
                actions: [okButton]);
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return alert;
              },
            );
          },
          child: const Text("Create Account",
              style: TextStyle(
                  color: Color(0xFF000000), fontWeight: FontWeight.bold)),
          style: ElevatedButton.styleFrom(
            side: const BorderSide(color: Color(0xFF000000)), backgroundColor: const Color(0xFFE6E6E6),
          ),
        ),
      )),
    );
  }
}

class ReturnToLoginRegButton extends StatelessWidget {
  const ReturnToLoginRegButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical * 2,
          left: SizeConfig.blockSizeHorizontal * 5,
          right: SizeConfig.blockSizeHorizontal * 5),
      child: Center(
          child: SizedBox(
        height: SizeConfig.blockSizeVertical * 5,
        width: SizeConfig.blockSizeHorizontal * 50,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Back to Login",
              style: TextStyle(
                  color: Color(0xFF000000), fontWeight: FontWeight.bold)),
          style: ElevatedButton.styleFrom(
            side: const BorderSide(color: Color(0xFF000000)), backgroundColor: const Color(0xFFE6E6E6),
          ),
        ),
      )),
    );
  }
}
