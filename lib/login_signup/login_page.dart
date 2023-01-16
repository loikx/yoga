import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'components/input_fields.dart';
import '../animations/page_animation.dart';
import 'signup_page.dart';
import 'page_body.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    return PageScelet(
      pageName: 'LOG IN',
      fieldsWidget: const InputFields(isLogIn: true),
      onButtonPress: () {
        Navigator.push(
            context,
            PageAnimation(
                enterPage: const SignUpPage(),
                exitPage: this,
                isReversed: false));
      },
    );
  }
}
