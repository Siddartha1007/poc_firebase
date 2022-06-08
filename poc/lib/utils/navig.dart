import 'package:flutter/material.dart';

class NavigContext {
  static final GlobalKey<NavigatorState> navigatorState = GlobalKey();
}

mixin Navig{
  BuildContext? get ctx => NavigContext.navigatorState.currentContext;

  Future<dynamic> push(Widget page) =>
      Navigator.of(ctx!).push(MaterialPageRoute(builder: (context) => page));

  Future<dynamic> pushReplacement(Widget page) => 
      Navigator.of(ctx!).pushReplacement(MaterialPageRoute(builder: (context) => page));

  Future<dynamic> pushAndRemoveUntil(Widget page) =>
      Navigator.of(ctx!).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => page), (_) => false);

  void pop() => Navigator.of(ctx!).pop();
}