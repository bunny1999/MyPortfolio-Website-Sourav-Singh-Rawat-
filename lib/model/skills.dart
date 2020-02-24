import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
class skills{
  String imageUrl;
  String name;
  List<Color> color;
  int level;
  skills({this.imageUrl,this.name,this.color,this.level});
}

List<skills> skillsList=[
  new skills(
    imageUrl:"images/skillsImages/flutter.jpg",
    name: "Flutter",
    color: [Color.fromRGBO(69, 208, 252,1.0),Color.fromRGBO(2, 83, 154,1.0)],
    level: 2,
  ),
  new skills(
    imageUrl:"images/skillsImages/dart.png",
    name: "Dart",
    color: [Colors.tealAccent,Color.fromRGBO(0, 129, 200,1.0)],
    level: 2,
  ),
  new skills(
    imageUrl:"images/skillsImages/javaScript.png",
    name: "JavaScript",
    color: [Colors.yellowAccent],
    level: 3,
  ),
  new skills(
    imageUrl:"images/skillsImages/python.png",
    name: "Python",
    color: [Colors.blue[600],Colors.yellow],
    level: 1,
  ),
  new skills(
    imageUrl:"images/skillsImages/java.png",
    name: "Java",
    color: [Colors.blue,Colors.deepOrange[400]],
    level: 2,
  ),
  new skills(
    imageUrl:"images/skillsImages/html.png",
    name: "Html",
    color: [Colors.deepOrange],
    level: 3,
  ),
  new skills(
    imageUrl:"images/skillsImages/css.jpg",
    name: "CSS",
    color: [Colors.blue[300]],
    level: 2,
  ),
  new skills(
    imageUrl:"images/skillsImages/bootstrap.jpg",
    name: "Bootstrap",
    color: [Colors.purple],
    level: 2,
  ),
  new skills(
    imageUrl:"images/skillsImages/jquery.png",
    name: "JQuery",
    color: [Colors.blue[600]],
    level: 2,
  ),
  new skills(
    imageUrl:"images/skillsImages/c.png",
    name: "C",
    color: [Colors.blue[900]],
    level: 2,
  ),
  new skills(
    imageUrl:"images/skillsImages/cplusplus.png",
    name: "C++",
    color: [Colors.blue],
    level: 2,
  ),
  new skills(
    imageUrl:"images/skillsImages/php.png",
    name: "Php",
    color: [Colors.blue[200]],
    level: 2,
  ),
  new skills(
    imageUrl:"images/skillsImages/mysql.jpg",
    name: "MySql",
    color: [Colors.blue,Colors.deepOrange],
    level: 1,
  ),
];