import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'lesson_scroll_view.dart';
import 'package:yoga/constants.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: size.height * 0.051,
            ),
            _createText('New'),
            LessonScroll(lessons: demoLessons),
            _createText('Popular'),
            LessonScroll(lessons: demoLessons),
            _createText('Courses'),
            LessonScroll(lessons: demoLessons),
          ],
        ),
      ),
    );
  }

  Widget _createText(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: GoogleFonts.roboto(
          color: darkColor,
          fontSize: defaultTextSize * 1.5,
        ),
      ),
    );
  }
}
