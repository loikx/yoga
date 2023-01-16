import 'package:flutter/material.dart';
import 'package:yoga/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputFields extends StatefulWidget {
  const InputFields({required this.isLogIn, Key? key}) : super(key: key);

  final bool isLogIn;

  @override
  State<InputFields> createState() => _InputFieldsState();
}

class _InputFieldsState extends State<InputFields> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
        height: size.height * (widget.isLogIn ? 0.3 : 0.36),
        width: size.width * 0.85,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:
              widget.isLogIn ? _textFieldsLogInPage() : _textFieldsSignUpPage(),
        ));
  }

  List<Widget> _textFieldsLogInPage() {
    return <Widget>[
      _createTextField(FontAwesomeIcons.envelope, null, 'Email', false),
      _createTextField(
          FontAwesomeIcons.key, Icons.visibility, 'Password', _isObscure),
      _forgotPassword(),
    ];
  }

  List<Widget> _textFieldsSignUpPage() {
    return <Widget>[
      _createTextField(FontAwesomeIcons.user, null, 'User name', false),
      _createTextField(FontAwesomeIcons.envelope, null, 'Email', false),
      _createTextField(
          FontAwesomeIcons.key, Icons.visibility, 'Password', _isObscure),
      _createTextField(FontAwesomeIcons.key, Icons.visibility,
          'Confirm password', _isObscure)
    ];
  }

  Widget _forgotPassword() {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        overlayColor: MaterialStateColor.resolveWith((states) => greyColor),
      ),
      child: Text(
        'Forgot Password?',
        style: GoogleFonts.roboto(
          fontSize: defaultTextSize * 1.25,
          color: darkColor,
        ),
      ),
    );
  }

  Widget _createTextField(
      IconData prefix, IconData? suffix, String hintText, bool obscure) {
    return TextField(
      cursorColor: darkColor,
      style: GoogleFonts.roboto(
        fontSize: defaultTextSize,
        color: darkColor,
      ),
      obscureText: obscure,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefix,
          color: primaryColor,
          size: defaultPadding,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            suffix,
            size: defaultPadding,
            color: greyColor,
          ),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.roboto(
          fontSize: defaultTextSize,
          color: darkColor,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultPadding),
            borderSide: BorderSide(
              color: accentColor,
              width: 2,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultPadding),
            borderSide: BorderSide(
              color: accentColor,
              width: 2,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultPadding),
            borderSide: BorderSide(
              color: accentColor,
              width: 2,
            )),
      ),
    );
  }
}
