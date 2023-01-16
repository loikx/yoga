import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yoga/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ConnectionWays extends StatelessWidget {
  const ConnectionWays({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'or connect with',
          style: GoogleFonts.roboto(
              color: darkColor, fontSize: defaultTextSize * 1.25),
        ),
        SizedBox(
          height: defaultPadding,
        ),
        SizedBox(
          width: size.width * 0.6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _createSocialIcon(FontAwesomeIcons.facebookF, () {}),
              _createSocialIcon(FontAwesomeIcons.twitter, () {}),
              _createSocialIcon(FontAwesomeIcons.google, () {})
            ],
          ),
        ),
      ],
    );
  }

  Widget _createSocialIcon(IconData iconData, Function onPress) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: accentColor),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon:
              Icon(iconData, color: primaryColor, size: defaultPadding * 1.25),
          onPressed: () => onPress(),
          splashColor: primaryColor.withOpacity(0.2),
        ));
  }
}
