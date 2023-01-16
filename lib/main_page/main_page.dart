import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yoga/constants.dart';
import 'components/main_appbar/main_appbar.dart';
import 'components/main_view.dart';
import '../profile/profile_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({required this.title, Key? key}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    /// Attach a listener which will update the state and refresh the page index
    controller.addListener(() {
      if (controller.page!.round() != currentIndex) {
        setState(() {
          currentIndex = controller.page!.round();
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: currentIndex == 2
          ? null
          : MainAppBar(
              title: widget.title,
              height: size.height * 0.2,
            ),
      body: PageView(
        controller: controller,
        onPageChanged: (int index) {
          // setState(() {});
        },
        children: <Widget>[
          Container(),
          const MainView(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: size.height * 0.1,
          // color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _createBottomBarItem(
                  size, FontAwesomeIcons.bell, 0, currentIndex == 0),
              _createBottomBarItem(
                  size, Icons.home_outlined, 1, currentIndex == 1),
              _createBottomBarItem(
                  size, Icons.account_circle_outlined, 2, currentIndex == 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createBottomBarItem(
      Size size, IconData icon, int pageIndex, bool isSelected) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: size.height * 0.01,
          width: size.width * 0.02,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? primaryColor : Colors.white,
          ),
        ),
        IconButton(
          iconSize: size.height * 0.04,
          // padding: EdgeInsets.only(left: 28.0),
          icon: Icon(icon, color: primaryColor),
          onPressed: () {
            setState(() {
              controller.animateToPage(pageIndex,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear);
            });
          },
        ),
      ],
    );
  }
}
