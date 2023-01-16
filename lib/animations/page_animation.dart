import 'package:flutter/material.dart';

class PageAnimation extends PageRouteBuilder {
  PageAnimation(
      {required this.exitPage,
      required this.enterPage,
      required this.isReversed})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => enterPage,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return Stack(
              children: <Widget>[
                SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset.zero,
                      end: Offset(isReversed ? 1.0 : -1.0, 0.0),
                    ).animate(animation),
                    child: exitPage),
                SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(isReversed ? -1.0 : 1.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: enterPage,
                ),
              ],
            );
          },
          transitionDuration: const Duration(milliseconds: 350),
        );

  final Widget enterPage;
  final Widget exitPage;
  final bool isReversed;
}
