import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/settings_row.dart';
import '/constants.dart';

class SettingsDialog extends StatefulWidget {
  const SettingsDialog({Key? key}) : super(key: key);

  @override
  State createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 350));

    _controller.addListener(() {
      setState(() {});
    });

    _controller.forward();
  }

  @override
  dispose() {
    _controller.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    _animation = Tween<double>(
      begin: 0,
      end: size.height * 0.9,
    ).animate(
      CurvedAnimation(curve: Curves.decelerate, parent: _controller),
    );

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => _createStuff(size, context),
    );
  }

  Widget _createCurtain(Size size, BuildContext context) {
    return GestureDetector(
        onVerticalDragUpdate: (DragUpdateDetails dragUpdateDetails) {
          setState(() {
            if (size.height - dragUpdateDetails.globalPosition.dy >
                size.height * 0.4) {
              _controller.value =
                  1 - (dragUpdateDetails.globalPosition.dy / size.height);
            } else {
              Navigator.pop(context);
            }
          });
        },
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: size.width * 0.2,
            height: size.height * 0.01,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultPadding * 2),
              color: greyColor,
            ),
          ),
        ));
  }

  Widget _createText(String text) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        color: darkColor,
        fontSize: defaultTextSize * 1.5,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _createStuff(Size size, BuildContext context) {
    SizedBox box = SizedBox(height: defaultPadding * 3);
    SizedBox miniBox = SizedBox(height: defaultPadding);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(defaultPadding),
                topRight: Radius.circular(defaultPadding)),
          ),
          height: _animation.value,
          width: size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: defaultPadding * 2, vertical: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _createCurtain(size, context),
                box,
                _createText('Your level'),
                SettingsBox(items: level),
                miniBox,
                _createText('Interests'),
                SettingsBox(items: interests),
                miniBox,
                _createText('Lessond duration'),
                miniBox,
              ],
            ),
          )),
    );
  }
}
