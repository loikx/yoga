import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/constants.dart';

class SettingsPageScelet extends StatelessWidget {
  const SettingsPageScelet(
      {required this.text,
      required this.fieldsWidget,
      required this.onButtonPress,
      Key? key})
      : super(key: key);
  final String text;
  final Widget fieldsWidget;
  final Function onButtonPress;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
              child: Image.asset(
            'assets/images/meditation.jpg',
            width: size.width * 0.85,
            height: size.height * 0.35,
          )),
          Text('What is your $text?',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                fontSize: defaultTextSize * 2,
                color: darkColor,
              )),
          Text('Let us know you better',
              style: GoogleFonts.roboto(
                fontSize: defaultTextSize,
                color: darkColor.withOpacity(0.5),
              )),
          fieldsWidget,
          SizedBox(
              height: size.height * 0.09,
              width: size.width * 0.85,
              child: _createButton()),
        ],
      ),
    );
  }

  Widget _createButton() {
    return ElevatedButton(
        onPressed: () => onButtonPress(),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultPadding * 4),
            ),
          ),
        ),
        child: Text(
          'Continue',
          style: GoogleFonts.roboto(
            fontSize: defaultPadding,
            color: Colors.white,
          ),
        ));
  }
}
