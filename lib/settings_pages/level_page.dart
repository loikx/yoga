import 'package:flutter/material.dart';
import 'package:yoga/settings_pages/page_body.dart';
import '../settings_pages/components/tiles.dart';
import '../animations/page_animation.dart';
import '../settings_pages/gender_page.dart';

class LevelPage extends StatelessWidget {
  const LevelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingsPageScelet(
        text: 'level',
        fieldsWidget:
            const TilesList(names: ['Begginer', 'Intermadiate', 'Advanced']),
        onButtonPress: () {
          Navigator.push(
            context,
            PageAnimation(
                enterPage: const GenderPage(),
                exitPage: this,
                isReversed: false),
          );
        });
  }
}
