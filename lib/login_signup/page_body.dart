import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import 'components/connection_ways.dart';
import '../settings_pages/level_page.dart';

class PageScelet extends StatelessWidget {
  const PageScelet(
      {required this.onButtonPress,
      required this.fieldsWidget,
      required this.pageName,
      Key? key})
      : super(key: key);

  final String pageName;
  final Widget fieldsWidget;
  final Function onButtonPress;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
                child: Image.asset(
              'assets/images/meditation.jpg',
              width: size.width * 0.85,
              height: size.height * 0.35,
            )),
            fieldsWidget,
            SizedBox(
              width: size.width * 0.85,
              height: size.height * 0.09,
              child: _createButton(context),
            ),
            _pageNavigationTextButton(pageName),
            const ConnectionWays(),
          ],
        ),
      ),
    );
  }

  Widget _createButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LevelPage()),
          );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultPadding * 4),
            ),
          ),
        ),
        child: Text(
          pageName,
          style: GoogleFonts.roboto(
            fontSize: defaultPadding,
            color: Colors.white,
          ),
        ));
  }

  Widget _pageNavigationTextButton(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          pageName == 'LOG IN'
              ? "Don't have an account?"
              : "Have an account already?",
          style: GoogleFonts.roboto(
            color: darkColor,
            fontSize: defaultTextSize * 1.25,
          ),
        ),
        TextButton(
          onPressed: () => onButtonPress(),
          style: TextButton.styleFrom(
              // splashFactory: InteractiveInkFeatureFactory()
              primary: primaryColor),
          child: Text(
            pageName == 'LOG IN' ? 'SIGN UP' : "LOG IN",
            style: GoogleFonts.roboto(
              fontSize: defaultTextSize * 1.25,
            ),
          ),
        ),
      ],
    );
  }
}
