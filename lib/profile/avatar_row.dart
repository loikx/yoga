import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '/constants.dart';

class AvatarRow extends StatelessWidget {
  const AvatarRow(
      {required this.profilePoints,
      required this.profilePercents,
      required this.src,
      Key? key})
      : super(key: key);

  final int profilePoints;
  final int profilePercents;
  final String src;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _textRow('$profilePoints', FontAwesomeIcons.coins),
        CircleAvatar(
          radius: defaultPadding * 1.5,
          backgroundImage: AssetImage(src),
        ),
        _textRow('$profilePercents%', FontAwesomeIcons.podcast),
      ],
    );
  }

  Widget _textRow(String text, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Icon(icon, color: yellowColor, size: defaultTextSize * 1.25),
        Text(text,
            style: GoogleFonts.roboto(
                color: darkColor,
                fontWeight: FontWeight.bold,
                fontSize: defaultTextSize * 1.25)),
      ],
    );
  }
}
