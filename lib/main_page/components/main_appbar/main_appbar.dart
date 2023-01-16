import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/additional_settings/additionla_settings_dialog.dart';
import 'appbar_panel.dart';
import '/constants.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar({required this.title, required this.height, Key? key})
      : super(key: key);
  final String title;
  final double height;
  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  State createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _createAppBar(widget.height, context),
        const DailyPlan(),
      ],
    );
  }

  AppBar _createAppBar(double height, BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      title: Text(
        widget.title,
        style: GoogleFonts.roboto(
          fontWeight: FontWeight.bold,
          fontSize: defaultTextSize * 1.75,
          color: Colors.white,
        ),
      ),
      leading:
          Icon(Icons.menu, color: Colors.white, size: defaultTextSize * 1.75),
      centerTitle: true,
      actions: <IconButton>[
        IconButton(
          icon: Icon(FontAwesomeIcons.magnifyingGlass,
              color: Colors.white, size: defaultTextSize * 1.75),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.settings,
              color: Colors.white, size: defaultTextSize * 1.75),
          onPressed: () {
            _showAdditionalSettings();
          },
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, height),
        child: Container(),
      ),
    );
  }

  void _showAdditionalSettings() {
    showDialog(
      context: context,
      builder: (context) => const SettingsDialog(),
    );
  }
}
