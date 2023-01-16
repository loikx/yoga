import 'package:flutter/material.dart';
import 'components/input_fields.dart';
import '../animations/page_animation.dart';
import 'login_page.dart';
import 'page_body.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageScelet(
      fieldsWidget: const InputFields(
        isLogIn: false,
      ),
      pageName: 'SIGN UP',
      onButtonPress: () {
        Navigator.push(
            context,
            PageAnimation(
                enterPage: const LogInPage(),
                exitPage: this,
                isReversed: true));
      },
    );
  }
}
