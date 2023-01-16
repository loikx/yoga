import 'package:flutter/material.dart';
import '../settings_pages/page_body.dart';
import '../settings_pages/goal_page.dart';
import '../animations/page_animation.dart';
import '../settings_pages/components/tiles.dart';

class GenderPage extends StatelessWidget {
  const GenderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingsPageScelet(
        text: 'gender',
        fieldsWidget: const TilesList(
          names: <String>['Male', 'Female', 'Non-binary'],
        ),
        onButtonPress: () {
          Navigator.push(
              context,
              PageAnimation(
                enterPage: const GoalPage(),
                exitPage: this,
                isReversed: false,
              ));
        });
  }
}
