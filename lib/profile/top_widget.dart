import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/constants.dart';

class TopIconsWidget extends StatelessWidget {
  const TopIconsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <IconButton>[
          IconButton(
            icon: Icon(Icons.settings,
                color: primaryColor, size: defaultTextSize * 1.75),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.pencil,
                color: primaryColor, size: defaultTextSize * 1.75),
            onPressed: () {},
          ),
        ]);
  }
}
