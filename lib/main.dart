import 'package:flutter/material.dart';
import 'package:ox/PlayersScreen.dart';
import 'package:ox/XoScreen.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      PlayerScreen.routeName:(_)=>PlayerScreen(),
      XoScreen.routeName:(_)=>XoScreen(),
    },
    initialRoute: PlayerScreen.routeName,
  ));
}
