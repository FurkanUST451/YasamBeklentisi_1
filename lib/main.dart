import 'package:flutter/material.dart';

import 'InputPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        hintColor: Colors.yellow[700],
      appBarTheme:AppBarTheme(color: Colors.yellow[700])
      ),
      home:InputPage(),
    );
  }
}
