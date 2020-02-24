import 'dart:ui';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:myPortfolioNew/responsive_widgets.dart';
import 'package:myPortfolioNew/screens/certificates.dart';
import 'package:myPortfolioNew/screens/projects.dart';
import 'package:myPortfolioNew/screens/skills.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  
  // ******** Last Update *************
  String lastUpdateDate="27/01/2019";
  // **********************************
  
  SolidController _solidController=SolidController();
  ScrollController _scrollController;
  AnimationController _animationController;
  Animation<double> animation;
  Color dragContainer=Colors.black;
  bool s=false;
  dragUpIconContainerHeig(context)=>50.0;
  // (0.73*MediaQuery.of(context).size.height)-(MediaQuery.of(context).size.height-(MediaQuery.of(context).size.height-(MediaQuery.of(context).size.height/1.5)));
  
  // double cornerRadi=115.0;

  int currentSlideIndex=1;
  
  Icon dragContaineIcon=Icon(Icons.keyboard_arrow_up,size:50.0,color: Colors.white);

  // bool isBottomOpen=false;
  bool skillCircleRotate=false;
  @override
  void initState(){
    super.initState();
    _scrollController=ScrollController();
    _scrollController.addListener(_scrollListner);
    _solidController.heightStream.listen((event){
        // print(event);
        if(event>MediaQuery.of(context).size.height/2){
          _solidController.show();
        }
    });

    //notWorking  
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..addListener(() => setState(() {}));

    animation = Tween<double>(
      begin: 50.0,
      end: 120.0,
    ).animate(_animationController);

    _animationController.forward();
    //

  }

  // Vector3 _shake() {
  //   double progress = animationController.value;
  //   double offset = sin(progress * pi * 10.0);
  //   return Vector3(offset * 4, 0.0, 0.0);
  // }
  bool _showDrag=false;
  _scrollListner(){
    if(_scrollController.offset == _scrollController.position.maxScrollExtent){
      setState(() {
        _showDrag=true;
      });
    }else{
      setState(() {
        _showDrag=false;
      });
    }
  }
  
  outLineBtn(var icons,String url)=>GestureDetector(
    child: CircleAvatar(
      backgroundColor: Colors.deepOrange,
      maxRadius: ResponsiveWidget.isSmallScreen(context)?15:20,
      child:CircleAvatar(
        backgroundColor: Colors.black,
        maxRadius: ResponsiveWidget.isSmallScreen(context)?13:18,
        child: Icon(
          icons,
          size: ResponsiveWidget.isSmallScreen(context)?18:null,
        ),
      ),
    ),
    onTap: () async{
      await launch(url);
    },
  );
  outLineBtnSpace(context)=>SizedBox(
    width: ResponsiveWidget.isSmallScreen(context)?7:10,
  );
  
  seprator(context)=>Container(color: Colors.deepOrange,height: ResponsiveWidget.isSmallScreen(context)?5:10.0,);

  mainContainter(String title,Widget content)=>Padding(
    padding: const EdgeInsets.all(30.0),
    child: Container(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Text(title,textScaleFactor:2.6,style:TextStyle(fontWeight: FontWeight.bold))),
          Container(color: Colors.grey,height: 2.0,),
          Container(
            // constraints: BoxConstraints.expand(height: 100),
            // height: 00.0,
            child: content,
          )
        ],
      ),
      padding: EdgeInsets.all(20.0),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Scaffold(
        backgroundColor: Colors.black,
        body:
        // Stack(
          // children: <Widget>[
            Container(
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin:Alignment.topLeft,
                  // end: Alignment.centerLeft,
                  stops:[0.01,0.60],
                  colors: [
                    Colors.deepOrange,
                    Colors.black,
                  ]
                )
              ),
              child: 
              SingleChildScrollView(
                controller: _scrollController,
                child: 
                AnimatedPadding(
                  duration: Duration(seconds: 1),
                  padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.1),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          outLineBtn(MdiIcons.facebook,"https://www.facebook.com/sourav1999"),
                          outLineBtnSpace(context),
                          outLineBtn(MdiIcons.instagram,"https://www.instagram.com/_bunny1999/"),
                          outLineBtnSpace(context),
                          outLineBtn(MdiIcons.linkedinBox,"https://www.linkedin.com/in/souravrawat-1999/"),
                          outLineBtnSpace(context),
                          outLineBtn(MdiIcons.githubBox,"https://github.com/bunny1999/"),
                        ],
                      ), 
                      Container(
                        height: ResponsiveWidget.isSmallScreen(context)?15:30,
                      ),       
                      Profile(),
                    ],
                  )
                )
              ),
            ),
        bottomSheet: !ResponsiveWidget.isSmallScreen(context) || _showDrag?SolidBottomSheet(
          controller: _solidController,
          maxHeight: MediaQuery.of(context).size.height-50,
          autoSwiped: false,
          elevation: 0.0,
          // showOnAppear: true,
          headerBar: AnimatedContainer(
            duration: Duration(seconds: 10),
            height: dragUpIconContainerHeig(context),
            child: Icon(Icons.keyboard_arrow_up,size:50.0,color: Colors.white,),
            decoration: BoxDecoration(
              color: dragContainer,
              boxShadow: [BoxShadow(blurRadius: 2.0,spreadRadius: 2.0,color: Colors.deepOrangeAccent)],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(70.0),
                topRight: Radius.circular(70.0),
              )
            ),
          ),
          body:SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Carousel(
              // onImageChange:(i,j){
              //   if(isBottomOpen){
              //     if(j==0){
              //       setState(() async{
              //         skillCircleRotate= true;
              //       });
              //     }else{
              //       setState(() async{
              //         skillCircleRotate=false;
              //       });
              //     }
              //   }
              // },
              images: <Widget>[
                Skills(lastUpdateDate,skillCircleRotate),
                Certificate(dragUpIconContainerHeig(context),lastUpdateDate),
                Projects(lastUpdateDate),
              ],
              autoplay: false,
              dotIncreasedColor: Colors.deepOrange,
            )
          ) 
        ):null,
      ),
    );
  }
}

class Profile extends StatelessWidget {
  AssetImage me = AssetImage("images/me1.jpg"); 

  photo(context)=> Column(
    children: <Widget>[
      Container(
        height: ResponsiveWidget.isSmallScreen(context)
        ?MediaQuery.of(context).size.height * 0.25
        :MediaQuery.of(context).size.width * 0.25,
        width: ResponsiveWidget.isSmallScreen(context)
        ?MediaQuery.of(context).size.height * 0.25
        :MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.luminosity,
          color: Colors.deepOrange,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: me,
            alignment: Alignment.center,
            fit: BoxFit.cover,
          )
        ),
      ),
    ],
  );
  
  Widget columnData = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        "Hi there! My name is",
        textScaleFactor: 2,
        style: TextStyle(color: Colors.orange),
      ),
      Text(
        "Sourav\nSingh Rawat",
        textScaleFactor: 5,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        "A Computer Science Engineering Student Of DSI,Bengaluru.\n"
        "Having decent knowledge of Flutter, Web Development, DSA,\n"
        "Python, Java, JavaScript.. some more Languages Mentioned\n"
        "Blow. & Highly Motivated to Learn New Skills !",
        softWrap: true,
        textScaleFactor: 1.5,
        style: TextStyle(color: Colors.white70),
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            shape: StadiumBorder(),
            child: Text("Resume",style: TextStyle(
              color: Colors.white,
            ),),
            color: Colors.red,
            onPressed: () {
             
            },
            padding: EdgeInsets.all(10),
          ),
          SizedBox(
            width: 20,
          ),
          OutlineButton(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            shape: StadiumBorder(),
            child: Text("Say Hi!",style: TextStyle(
              color: Colors.white,
            ),),
            color: Colors.red,
            onPressed: () {

            },
            padding: EdgeInsets.all(10),
          )
        ],
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          photo(context),
          columnData,
        ],
      ),
      smallScreen: Column(
        mainAxisSize: MainAxisSize.max, 
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          photo(context),
          columnData
        ],
      ),
    );
  }
}
