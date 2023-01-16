import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yoga/profile/avatar_row.dart';
import 'top_widget.dart';
import 'items.dart';
import 'package:yoga/models/user_model.dart';
import '/constants.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final UserModel user = defaultUserModel;
  static const List<Item> items = [
    Item(icon: Icons.star_border_outlined, text: 'Premium Center'),
    Item(icon: FontAwesomeIcons.notesMedical, text: 'Notes'),
    Item(icon: Icons.people, text: 'Invite friends'),
    Item(icon: Icons.favorite_border_outlined, text: 'Favorite'),
    Item(icon: Icons.music_note_outlined, text: 'Music for Youga'),
  ];

  @override
  Widget build(BuildContext context) {
    SizedBox box = SizedBox(height: defaultPadding);

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                    const TopIconsWidget(),
                    AvatarRow(
                        profilePoints: user.points,
                        profilePercents: user.percents,
                        src: user.srcImage),
                    box,
                    Text(
                      '${user.name} ${user.surname}, ${user.age}',
                      style: GoogleFonts.roboto(
                        color: darkColor,
                        fontSize: defaultTextSize * 1.25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    box,
                    _createButton(),
                  ] +
                  _createItems()),
        ),
      ),
    );
  }

  List<Widget> _createItems() {
    return List.generate(
        items.length,
        (index) => Padding(
              padding: EdgeInsets.all(defaultPadding / 2),
              child: items[index],
            ));
  }

  Widget _createButton() {
    return OutlinedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.present_to_all,
                color: yellowColor, size: defaultTextSize * 1.25),
            Text(
              'Speccial offer for you',
              style: GoogleFonts.roboto(
                  color: darkColor,
                  fontWeight: FontWeight.bold,
                  fontSize: defaultTextSize * 1.25),
            )
          ],
        ),
        style: OutlinedButton.styleFrom(
            primary: primaryColor,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: primaryColor, width: 5),
                borderRadius: BorderRadius.circular(defaultPadding / 2))),
        onPressed: () {});
  }
}
