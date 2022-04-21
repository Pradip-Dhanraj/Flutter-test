import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  Future<dynamic> navigateTo(String routeName,
      {dynamic arguments, Function? stateCallBack}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments)
        .then(
          (value) => stateCallBack!(),
        );
  }

  Future<dynamic> replaceCurrentWith(
    String routeName, {
    dynamic arguments,
    Function? stateCallBack,
  }) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments)
        .then((value) => stateCallBack!());
  }

  void goBack() {
    return navigatorKey.currentState!.pop();
  }
}
