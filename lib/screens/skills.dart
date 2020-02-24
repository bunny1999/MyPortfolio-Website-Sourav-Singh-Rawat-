import 'dart:ui';

import 'package:flutter/material.dart';
import '../model/skills.dart';
import '../responsive_widgets.dart';
import 'dart:math' as math;

class Skills extends StatefulWidget {
  String lastUpdateDate;
  bool rotate;
  Skills(this.lastUpdateDate,this.rotate);
  @override
  _SkillsState createState() => _SkillsState();
}

class _SkillsState extends State<Skills> with TickerProviderStateMixin {
  AnimationController _animationController;
  double firstColorAngle;
  double fInitalAngleValue=4.14;
  double secoundColorAngle;
  double sInitalAngleValue=-2.04;
  @override
  void initState(){
    super.initState();
    setState(() {
      setState(() {
        firstColorAngle=fInitalAngleValue/2;
        secoundColorAngle=sInitalAngleValue/2;
      });
    });
    _animationController=AnimationController(duration: Duration(seconds:1000),vsync: this,)
    ..addListener((){
      // print(object)
      fInitalAngleValue=fInitalAngleValue+0.01;
      sInitalAngleValue=sInitalAngleValue+0.01;
      setState(() { 
        firstColorAngle=fInitalAngleValue/2;
        secoundColorAngle=sInitalAngleValue/2;
        if(fInitalAngleValue==8.28 && sInitalAngleValue==0){
          fInitalAngleValue=4.14;
          sInitalAngleValue=-2.04;
        }
      });
    });
    if(widget.rotate){
        _animationController.forward(from: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return 
    // Stack(
      // children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.black,
            boxShadow: [BoxShadow(
              color: Colors.black,
              blurRadius: 30.0,
            )]
          ),
          child: Container(
            // width: MediaQuery.of(context).size.width-(MediaQuery.of(context).size.width/4),
            padding:EdgeInsets.only(left:MediaQuery.of(context).size.width/16,right: MediaQuery.of(context).size.width/16,
            // top:MediaQuery.of(context).size.width/32
            ),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:<Widget>[
                    Row(
                      children: <Widget>[
                        Text("Skills ",textScaleFactor:2.6,style:TextStyle(fontWeight: FontWeight.bold)),
                        Icon(Icons.wb_incandescent,color: Colors.deepOrange,)
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text("last update:${widget.lastUpdateDate}",textScaleFactor:0.8,style:TextStyle(color:Colors.grey)),
                        Row(
                          children:<Widget>[
                            Row(
                              children: <Widget>[
                                Container(width:10.0,height:10.0,color:Colors.red),
                                SizedBox(width:3.0),
                                Text("Basic",textScaleFactor:1.0,style:TextStyle(color:Colors.grey))
                              ],
                            ),
                            SizedBox(width:5.0),
                            Row(
                              children: <Widget>[
                                Container(width:10.0,height:10.0,color:Colors.yellow),
                                SizedBox(width:3.0),
                                Text("Mediate",textScaleFactor:1.0,style:TextStyle(color:Colors.grey))
                              ],
                            ),
                            SizedBox(width:5.0),
                            Row(
                              children: <Widget>[
                                Container(width:10.0,height:10.0,color:Colors.green),
                                SizedBox(width:3.0),
                                Text("Advance",textScaleFactor:1.0,style:TextStyle(color:Colors.grey))
                              ],
                            ),
                          ]
                        )
                      ],
                    )
                  ]
                ),
                Container(color: Colors.grey,height: 2.0,),
                Column(
                  children: <Widget>[
                    Container(
                      padding: !ResponsiveWidget.isSmallScreen(context)?EdgeInsets.only(left: 20.0,top:20.0):null,
                      // constraints: BoxConstraints.expand(height: 100),
                      height: MediaQuery.of(context).size.height-(MediaQuery.of(context).size.height/4),
                      child: ResponsiveWidget.isSmallScreen(context)?
                      ListView.builder(
                        itemCount: skillsList.length,
                        itemBuilder:(context,i)=>Container(
                          child: ListTile(
                            leading: Container(
                              height: 50.0,
                              width: 50.0,
                              child: 
                              CustomPaint(
                                foregroundPainter: MyPainter(
                                  lineColor: skillsList[i].color[0],
                                  completeColor: skillsList[i].color.length>1?skillsList[i].color[1]:skillsList[i].color[0],
                                  completePercent: skillsList[i].color.length<=1?100.0:0.0,
                                  firstColorAngle: firstColorAngle,
                                  secoundColorAngle: secoundColorAngle,
                                  width: 3.0,
                                ),
                                child: CircleAvatar(
                                  maxRadius: 23,
                                  backgroundColor: Colors.black,
                                  child: CircleAvatar(
                                    maxRadius: 21,
                                    backgroundColor: Colors.white,
                                    backgroundImage: AssetImage(skillsList[i].imageUrl),
                                  ),
                                ),
                              ),
                            ),
                            title: Text(skillsList[i].name),
                            trailing: Container(
                              height: 35.0,
                              width: 35.0,
                              child: CustomPaint(
                                foregroundPainter: MyPainterForLevel(
                                  firstColor: skillsList[i].level>=1?Colors.red:Colors.grey,
                                  secoundColor: skillsList[i].level>=2?Colors.yellow:Colors.grey,
                                  thirdColor: skillsList[i].level==3?Colors.green:Colors.grey,
                                  width: 2.0,            
                                ),
                                child:Padding(
                                  padding: EdgeInsets.all(5.0),
                                    child: CustomPaint(
                                      foregroundPainter:skillsList[i].level<=1?Arrow(4):skillsList[i].level<=2?Arrow(5.15):Arrow(6.1),
                                    ),
                                ),
                              ),
                            ) 
                          ),
                        ),
                      )
                      :GridView.builder(
                        // physics: NeverScrollableScrollPhysics(),
                        itemCount: skillsList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 2.0,
                          mainAxisSpacing: ResponsiveWidget.isMediumScreen(context)?1.2:2.0,
                          childAspectRatio: ResponsiveWidget.isMediumScreen(context)?3.9:6.0,
                        ),
                        itemBuilder: (context,i)=>Container(
                          height: 30.0,
                          width: 30.0,
                          child: ListTile(
                            leading: Container(
                              height: 50.0,
                              width: 50.0,
                              child: 
                              CustomPaint(
                                foregroundPainter: MyPainter(
                                  lineColor: skillsList[i].color[0],
                                  completeColor: skillsList[i].color.length>1?skillsList[i].color[1]:skillsList[i].color[0],
                                  completePercent: skillsList[i].color.length<=1?100.0:0.0,
                                  firstColorAngle: firstColorAngle,
                                  secoundColorAngle: secoundColorAngle,
                                  width: 3.0,
                                ),
                                child: CircleAvatar(
                                  maxRadius: 23,
                                  backgroundColor: Colors.black,
                                  child: CircleAvatar(
                                    maxRadius: 21,
                                    backgroundColor: Colors.white,
                                    backgroundImage: AssetImage(skillsList[i].imageUrl),
                                  ),
                                ),
                              ),
                            ),
                            title: Text(skillsList[i].name),
                            trailing: Container(
                              height: 35.0,
                              width: 35.0,
                              child: CustomPaint(
                                foregroundPainter: MyPainterForLevel(
                                  firstColor: skillsList[i].level>=1?Colors.red:Colors.grey,
                                  secoundColor: skillsList[i].level>=2?Colors.yellow:Colors.grey,
                                  thirdColor: skillsList[i].level==3?Colors.green:Colors.grey,
                                  width: 2.0,            
                                ),
                                child:Padding(
                                  padding: EdgeInsets.all(5.0),
                                    child: CustomPaint(
                                      foregroundPainter:skillsList[i].level<=1?Arrow(4):skillsList[i].level<=2?Arrow(5.15):Arrow(6.1),
                                    ),
                                ),
                              ),
                            ) 
                          ),
                        ),                      
                      ),
                    ),
                    //FOR OTHER SKILLS
                    // Container(
                    //   color:Colors.red,
                    //   height:20.0,
                    // )
                  ],
                ),
              ],
            ),
          ),
        );
        // Positioned(
          // child: OutlineButton(),
          //sliding button
        // )
      // ],
    // );
  }
}

class Arrow extends CustomPainter {
  double angle;
  Arrow(this.angle);
  @override
  void paint(Canvas canvas, Size size) {
    Paint line = new Paint()
        ..color = Colors.white
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0;
    Offset center  = new Offset(size.width/2, size.height/1.5);
    double radius  = math.min(size.width/2,size.height/2);
    canvas.drawArc(
      new Rect.fromCircle(center: center,radius: radius),
      angle,
      0.1,
      true,
      line
    ); 
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class MyPainter extends CustomPainter{
  Color lineColor;
  Color completeColor;
  double completePercent;
  double firstColorAngle;
  double secoundColorAngle;
  double width;
  MyPainter({this.lineColor,this.completeColor,this.completePercent,this.firstColorAngle,this.secoundColorAngle,this.width});
  
  double min(double val1,double val2){
    if(val1<val2){
      return val1;
    }
    else{
      return val2;
    }
  }
  
  @override
  void paint(Canvas canvas, Size size) {
    Paint line = new Paint()
        ..color = lineColor
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..strokeWidth = width;
    Paint complete = new Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Offset center  = new Offset(size.width/2, size.height/2);
    double radius  = min(size.width/2,size.height/2);
    // double arcAngle = 2*3.14* (completePercent/100);
    if(completePercent==100){
      canvas.drawCircle(
        center,
        radius,
        line
      ); 
    }else{
      canvas.drawArc(
          new Rect.fromCircle(center: center,radius: radius),
          firstColorAngle,
          3.0,
          false,
          line
      );
      canvas.drawArc(
          new Rect.fromCircle(center: center,radius: radius),
          secoundColorAngle,
          2.9,
          false,
          complete
      );
    }  
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
//for levels
class MyPainterForLevel extends CustomPainter{
  Color firstColor;
  Color secoundColor;
  Color thirdColor;
  double completePercent;
  double width;
  MyPainterForLevel({this.firstColor,this.secoundColor,this.thirdColor,this.completePercent,this.width});
  
  double min(double val1,double val2){
    if(val1<val2){
      return val1;
    }
    else{
      return val2;
    }
  }
  
  @override
  void paint(Canvas canvas, Size size) {
    Paint firstLevel = new Paint()
        ..color = firstColor
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..strokeWidth = width;
    Paint secoundLevel = new Paint()
      ..color = secoundColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Paint thirdLevel = new Paint()
      ..color = thirdColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Offset center  = new Offset(size.width/2, size.height/2);
    double radius  = min(size.width/2,size.height/2);
    canvas.drawArc(
      new Rect.fromCircle(center: center,radius: radius), 
      5.85/2, 
      1.0, 
      false, 
      firstLevel
    );
    canvas.drawArc(
      new Rect.fromCircle(center: center,radius: radius), 
      8.3/2, 
      1.0, 
      false, 
      secoundLevel
    );
    canvas.drawArc(
      new Rect.fromCircle(center: center,radius: radius), 
      10.85/2, 
      1.0, 
      false, 
      thirdLevel
    );
    // double arcAngle = 2*3.14* (completePercent/100);
    // canvas.drawArc(
    //     new Rect.fromCircle(center: center,radius: radius),
    //     -3.14/2, //starting angle of next color
    //     arcAngle,//end angle of next color
    //     false,
    //     complete
    // );
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

