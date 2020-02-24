import 'package:flutter/material.dart';

class badge{
  Color backgroudColor;
  String pngImage;
  String badgeTitle;
  bool isLongTitle=false;
  int starsCount;
  String level;
  double remainPoint;
  String forTask;
  bool priority=false;
  badge({this.isLongTitle,this.priority,this.backgroudColor,this.pngImage,this.badgeTitle,this.starsCount,this.level,this.remainPoint,this.forTask});
}

List<badge> Badges=[
  new badge(
    backgroudColor:Color.fromRGBO(249, 178, 153, 1.0),
    pngImage: "images/badges/dsa.png",
    badgeTitle:"DSA",
    isLongTitle: false,
    starsCount: 2,
    level: "Bronze Level",
    remainPoint: 10.5,
    forTask: "Next Star",
    priority: false,
  ),
  new badge(
    backgroudColor:Color.fromRGBO(191, 214, 217, 1.0),
    pngImage: "images/badges/java.png",
    badgeTitle: "Java",
    isLongTitle: false,
    starsCount: 4,
    level: "Silver Level",
    remainPoint: 80.0,
    forTask: "Gold Badge",
    priority: true,
  ),
  new badge(
    backgroudColor:Color.fromRGBO(191, 214, 217, 1.0),
    pngImage: "images/badges/python.png",
    badgeTitle: "Python",
    isLongTitle: false,
    starsCount: 4,
    level: "Silver Level",
    remainPoint: 104.51,
    forTask: "Gold Badge",
    priority: true,
  ),
  new badge(
    backgroudColor:Color.fromRGBO(191, 214, 217, 1.0),
    pngImage: "images/badges/cpp.png",
    badgeTitle:"CPP",
    isLongTitle: false,
    starsCount: 3,
    level: "Silver Level",
    remainPoint: 70,
    forTask: "Next Star",
    priority: false,
  ),
];