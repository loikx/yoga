import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/constants.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    DateTime now = DateTime.now();
    int day = now.day;
    int weekDay = now.weekday;
    return SizedBox(
      width: size.width * 0.17,
      height: size.height * 0.1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _createTextContainer(size.height * 0.05, weekDayTranslation[weekDay]),
          _createTextContainer(size.height * 0.05, day, isPrimaryColored: true),
        ],
      ),
    );
  }

  Widget _createTextContainer(double height, var text,
      {bool isPrimaryColored = false}) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: _createRadius(isPrimaryColored),
        color: isPrimaryColored ? Colors.white : primaryColor,
      ),
      child: Center(
          child: Text(
        '$text',
        style: GoogleFonts.roboto(
          color: isPrimaryColored ? primaryColor : Colors.white,
          fontSize: defaultTextSize * 1.5,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }

  BorderRadius _createRadius(bool isColored) {
    return isColored
        ? BorderRadius.only(
            bottomLeft: Radius.circular(defaultPadding / 4),
            bottomRight: Radius.circular(defaultPadding / 4),
          )
        : BorderRadius.only(
            topLeft: Radius.circular(defaultPadding / 4),
            topRight: Radius.circular(defaultPadding / 4),
          );
  }
}
