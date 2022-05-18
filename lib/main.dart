import 'package:flutter/material.dart';
import "package:provider/provider.dart";

import './screens/nav_screen.dart';

import './providers/global_state_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => GlobalData(),
      child: MaterialApp(
        title: "Flutter Netflix UI",
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.black
        ),
        home: const NavScreen(),
      ),
    );
  }
}


