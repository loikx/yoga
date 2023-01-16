import 'package:flutter/material.dart';
import '../../models/lesson_model.dart';
import '../../main_page/components/lesson_tile.dart';
import '/constants.dart';

class LessonScroll extends StatelessWidget {
  const LessonScroll({required this.lessons, Key? key}) : super(key: key);

  final List<Lesson> lessons;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
            lessons.length,
            (index) => index > 0
                ? Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: defaultPadding / 2,
                        vertical: defaultPadding / 2),
                    child: LessonTile(lesson: demoLessons[index]))
                : LessonTile(lesson: demoLessons[index])),
      ),
    );
  }
}
