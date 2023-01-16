import 'package:flutter/material.dart';
import '../settings_pages/page_body.dart';
import '../settings_pages/components/tiles.dart';
import '../main_page/main_page.dart';

class GoalPage extends StatelessWidget {
  const GoalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingsPageScelet(
        text: 'goal',
        fieldsWidget: const TilesList(
          names: <String>[
            'Weight lose',
            'Better sleep quality',
            'Body relax',
            'Posture correction'
          ],
        ),
        onButtonPress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MainPage(title: 'Welcome Anna')));
        });
  }
}
