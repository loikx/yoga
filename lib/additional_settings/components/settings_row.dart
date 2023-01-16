import 'package:flutter/material.dart';
import 'settings_item.dart';
import '/constants.dart';

class SettingsBox extends StatelessWidget {
  const SettingsBox({Key? key, required this.items}) : super(key: key);

  final List items;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
              items.length,
              (index) => Padding(
                  child: SettingsItem(
                      isSelected: items[index].isSelected,
                      text: items[index].text),
                  padding: EdgeInsets.symmetric(
                      horizontal: defaultPadding / 3,
                      vertical: defaultPadding)))),
    );
  }
}
