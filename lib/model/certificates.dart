import 'package:flutter/material.dart';

class certificates{
  String certiImage;
  String title;
  String company;
  String techLogo;
  String logo;
  String issueDate;
  Color companyColor;
  String credID;
  certificates({this.credID,this.techLogo,this.certiImage,this.company,this.logo,this.title,this.issueDate,this.companyColor});
}

List<certificates> certificate=[
  new certificates(
    certiImage:"images/certificates/dart.jpg",
    companyColor: Color.fromRGBO(113, 229, 62, 1.0),
    company: "LCO",
    techLogo: "images/skillsImages/dart.png",
    logo: "images/lco.png",
    title: "Dart Certificate",
    issueDate: "Sep 2019",
    credID: "1367565359162410812"
  ),
  new certificates(
    certiImage:"images/certificates/flutter.jpg",
    company: "LCO",
    companyColor: Color.fromRGBO(113, 229, 62, 1.0),
    techLogo: "images/skillsImages/flutter.jpg",
    logo: "images/lco.png",
    title: "Flutter Certificate",
    issueDate: "Jan 2020",
    credID: "1367565366242410834"
  ),
  new certificates(
    certiImage:"images/certificates/cct2.jpg",
    companyColor: Color.fromRGBO(12, 35, 96, 1.0),
    company: "CyberCure Techno.",
    techLogo: "images/hacking.png",
    logo: "images/cyberCure.png",
    title: "Ethical hacking & Cyber Security",
    issueDate: "Aug 2018"
  ),
  new certificates(
    certiImage:"images/certificates/cct1.jpg",
    companyColor: Color.fromRGBO(12, 35, 96, 1.0),
    company: "CyberCure Techno.",
    techLogo: "images/hacking.png",
    logo: "images/cyberCure.png",
    title: "Ethical hacking & Cyber Security",
    issueDate: "Mar 2018"
  ),
  new certificates(
    certiImage:"images/certificates/geeksLab1.jpg",
    companyColor: Color.fromRGBO(65, 147, 91, 1.0),
    company: "Geekslab Techno.",
    techLogo: "images/iot.png",
    logo: "images/geekslab-logo.png",
    title: "A.I & M.L",
    issueDate: "Sept 2019"
  ),
  new certificates(
    certiImage:"images/certificates/geeksLab2.jpg",
    companyColor: Color.fromRGBO(65, 147, 91, 1.0),
    company: "Geekslab Techno.",
    techLogo: "images/iot.png",
    logo: "images/geekslab-logo.png",
    title: "The Internet Of Things",
    issueDate: "Nov 2017"
  ),
  new certificates(
    certiImage:"images/certificates/hackman.jpg",
    companyColor: Color.fromRGBO(0, 125, 197, 1.0),
    company: "DSI",
    techLogo: "images/devloper.png",
    logo: "images/dsi_logo.png",
    title: "Hackman 2.0",
    issueDate: "Nov 2017"
  ),
];