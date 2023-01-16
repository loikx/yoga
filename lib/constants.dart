import 'package:flutter/material.dart';
import 'package:yoga/models/user_model.dart';
import '../models/lesson_model.dart';
import '../models/settings_items_model.dart';

Color accentColor = const Color(0xfff6eaff);
Color darkColor = const Color(0xff1d1d1d);
Color whiteColor = const Color(0xfff6eaff);
Color yellowColor = const Color(0xffffcc73);
Color primaryColor = const Color(0xffb58dd4);
Color greyColor = const Color(0xffb1b1b2);

double defaultPadding = 20;
double defaultTextSize = 14;

Map<int, String> weekDayTranslation = <int, String>{
  1: 'Mon',
  2: 'Tue',
  3: 'Wed',
  4: 'Thu',
  5: 'Fri',
  6: 'Sat',
  7: 'Sun',
};

List<Lesson> demoLessons = <Lesson>[
  const Lesson(name: 'Healthy back', src: 'assets/images/burger.png'),
  const Lesson(name: 'Healthy back', src: 'assets/images/burger.png'),
  const Lesson(name: 'Healthy back', src: 'assets/images/burger.png'),
];

UserModel defaultUserModel = UserModel(
    name: 'Anna',
    surname: 'Kim',
    age: 35,
    points: 100,
    percents: 80,
    srcImage: 'assets/images/icon.jpg');

List<SettingsItemModel> level = <SettingsItemModel>[
  SettingsItemModel(text: 'Beginner', isSelected: true),
  SettingsItemModel(text: 'Intermadiate', isSelected: false),
  SettingsItemModel(text: 'Advanced', isSelected: false),
];

List<SettingsItemModel> interests = <SettingsItemModel>[
  SettingsItemModel(text: 'Back', isSelected: false),
  SettingsItemModel(text: 'Neck', isSelected: false),
  SettingsItemModel(text: 'Limbs', isSelected: false),
  SettingsItemModel(text: 'Joints', isSelected: false),
  SettingsItemModel(text: 'Stomach', isSelected: false),
  SettingsItemModel(text: 'Relax', isSelected: false),
  SettingsItemModel(text: 'Good dream', isSelected: false),
  SettingsItemModel(text: 'Strong body', isSelected: false),
  SettingsItemModel(text: 'Asanas', isSelected: false),
  SettingsItemModel(text: 'Meditation', isSelected: false),
];
