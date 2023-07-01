import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class NavigatorServices {
  void to({
    required BuildContext context,
    required Widget widget,
    PageTransitionType pageTransitionType = PageTransitionType.fade,
  }) {
    Navigator.of(context).push(
      PageTransition(
        child: widget,
        type: pageTransitionType,
        duration: const Duration(milliseconds: 100),
      ),
    );
  }

  void toReplacement(
      {required BuildContext context, required Widget widget, PageTransitionType pageTransitionType = PageTransitionType.fade}) {
    Navigator.of(context).pushReplacement(
      PageTransition(
        child: widget,
        type: pageTransitionType,
        duration: const Duration(milliseconds: 100),
      ),
    );
  }

  void toAllReplacement(
      {required BuildContext context, required Widget widget, PageTransitionType pageTransitionType = PageTransitionType.fade}) {
    Navigator.of(context).pushAndRemoveUntil(
        PageTransition(
          child: widget,
          type: pageTransitionType,
          duration: const Duration(milliseconds: 100),
        ),
        (Route<dynamic> route) => false);
  }

  void pop({
    required BuildContext context,
  }) {
    Navigator.pop(context);
  }
}
