import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/constants.dart';

class Item extends StatelessWidget {
  const Item({required this.icon, required this.text, Key? key})
      : super(key: key);
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    SizedBox box = SizedBox(height: defaultPadding / 2);
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {},
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(icon, color: primaryColor, size: defaultTextSize * 2),
                SizedBox(width: defaultPadding * 2),
                Text(text,
                    style: GoogleFonts.roboto(
                      color: darkColor,
                      fontSize: defaultTextSize * 1.5,
                    ))
              ],
            ),
            box,
            Container(
              height: size.height * 0.001,
              color: primaryColor,
            ),
          ]),
    );
  }
}
