import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/lesson_model.dart';
import '/constants.dart';

class LessonTile extends StatefulWidget {
  const LessonTile({required this.lesson, Key? key}) : super(key: key);

  final Lesson lesson;

  @override
  State<LessonTile> createState() => _LessonTileState();
}

class _LessonTileState extends State<LessonTile> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double widgetSize =
        size.height * 0.2 * 0.65 + defaultTextSize * 1.5 + defaultPadding * 1.5;
    return Container(
      width: size.width * 0.75,
      height: size.height * 0.2 > widgetSize ? size.height * 0.2 : widgetSize,
      child: Column(
        children: <Widget>[
          _createImage(size.height),
          _createBottomWidgetRow(),
        ],
      ),
      decoration: BoxDecoration(
        color: accentColor,
        borderRadius: BorderRadius.circular(defaultPadding * 2),
      ),
    );
  }

  Widget _createBottomWidgetRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: defaultPadding),
          child: Text(
            widget.lesson.name,
            style: GoogleFonts.roboto(
              color: darkColor,
              fontSize: defaultTextSize * 1.5,
              // fontWeight: FontWeight.w900,
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              _isLiked = !_isLiked;
            });
          },
          icon: Icon(_isLiked ? Icons.favorite : Icons.favorite_border_outlined,
              color: primaryColor, size: defaultTextSize * 1.5),
        ),
      ],
    );
  }

  Widget _createImage(double height) {
    return SizedBox(
      // width: height * 0.75,
      height: height * 0.2 * 0.65,
      child: SizedBox.expand(
          child: FittedBox(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(defaultPadding * 6),
                    topRight: Radius.circular(defaultPadding * 6)),
                child: Image.asset(widget.lesson.src),
              ),
              fit: BoxFit.fill)),
    );
  }
}
