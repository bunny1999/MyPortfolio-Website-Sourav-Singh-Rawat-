import 'dart:html';

import 'package:flutter/material.dart';
import 'package:myPortfolioNew/HomePage.dart';
// import 'package:myPortfolio/responsive_widgets.dart';
// import 'package:flutter_web/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Portfolio",
      theme: ThemeData(
        canvasColor: Colors.transparent,
        primaryColor: Colors.black,
        accentColor: Colors.orange,
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        )
      ),
      home: HomePage(),
    );
  }
}