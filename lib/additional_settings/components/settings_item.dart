import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/constants.dart';

class SettingsItem extends StatefulWidget {
  SettingsItem({
    Key? key,
    required this.isSelected,
    required this.text,
  }) : super(key: key);

  late bool isSelected;
  final String text;

  @override
  State createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  Color _textColor = darkColor;
  Color _containerColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        _changeState();
      },
      child: Container(
        width: defaultTextSize * widget.text.length,
        height: size.height * 0.8 * 0.075,
        decoration: BoxDecoration(
          color: _containerColor,
          borderRadius: BorderRadius.circular(defaultPadding * 2),
          border: Border.all(color: greyColor),
        ),
        child: Center(
            child: Text(widget.text,
                style: GoogleFonts.roboto(
                  color: _textColor,
                  fontWeight: FontWeight.w700,
                  fontSize: defaultTextSize,
                ))),
      ),
    );
  }

  void _changeState() {
    setState(() {
      widget.isSelected = !widget.isSelected;
      _textColor = widget.isSelected ? Colors.white : darkColor;
      _containerColor = widget.isSelected ? primaryColor : Colors.white;
    });
  }
}
