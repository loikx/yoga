import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/constants.dart';
import 'calendar.dart';

class DailyPlan extends StatelessWidget {
  const DailyPlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Align(
        alignment: const Alignment(0, 1.75),
        child: Container(
          decoration: BoxDecoration(
            color: accentColor,
            borderRadius: BorderRadius.circular(defaultTextSize),
          ),
          width: size.width * 0.85,
          height: size.height * 0.15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const CalendarWidget(),
              Text(
                'Your daily plan',
                style: GoogleFonts.roboto(
                  color: primaryColor,
                  fontSize: defaultTextSize * 1.5,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_right,
                color: primaryColor,
                size: defaultTextSize * 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
