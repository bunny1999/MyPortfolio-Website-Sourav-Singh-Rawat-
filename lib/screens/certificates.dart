import 'dart:ui';
import 'package:myPortfolioNew/model/badges.dart';
import 'package:polygon_clipper/polygon_border.dart';
import 'package:flutter/material.dart';
import '../responsive_widgets.dart';
import '../model/certificates.dart';
import 'package:url_launcher/url_launcher.dart';


class Certificate extends StatefulWidget {
  double dragContainerHeight;
  String lastUpdateDate;
  Certificate(this.dragContainerHeight,this.lastUpdateDate);
  @override
  _CertificateState createState() => _CertificateState();
}

class _CertificateState extends State<Certificate> {
  ScrollController _scrollController;
  @override
  void initState(){
    super.initState();
    _scrollController =ScrollController();
    _scrollController.addListener(gridViewScroll);
  }
  bool scrolling=false;
  gridViewScroll(){
    if(_scrollController.offset==_scrollController.position.minScrollExtent){
      setState(() {
        scrolling=false;
      });
    }else{
      setState(() {
        scrolling=true;
      });
    }
  }

  void popUp(String techLogo,String certifyImage){
    showDialog(
      context:context,
      builder: (BuildContext context){
        return Transform.rotate(
          angle: ResponsiveWidget.isSmallScreen(context)?1.571:0.0,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(10.0),
            ),
            contentPadding: EdgeInsets.all(0.0),
            titlePadding: EdgeInsets.all(0.0),
            content: Container(
              width: ResponsiveWidget.isSmallScreen(context)?MediaQuery.of(context).size.height:MediaQuery.of(context).size.width-(MediaQuery.of(context).size.width/4),
              height: ResponsiveWidget.isSmallScreen(context)?MediaQuery.of(context).size.width:null,
              child: Stack(
                fit:StackFit.expand,
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image:DecorationImage(
                        image: AssetImage(techLogo),
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0,sigmaY:5.0),
                      child: Container(
                        color:Colors.white.withOpacity(0.8)
                      )
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Container(
                      decoration:BoxDecoration(
                        image:certifyImage!=""?DecorationImage(
                          image:AssetImage(certifyImage),
                          fit: BoxFit.cover, 
                        ):null,
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5.0)
                      )
                    ),
                  )
                ],
              ),
            )
          ),
        );
      } 
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    Text("Achievements & Certificates ",textScaleFactor:ResponsiveWidget.isSmallScreen(context)?1.3:2.6,style:TextStyle(fontWeight: FontWeight.bold)),
                    Icon(Icons.school,color: Colors.deepOrange,)
                  ],
                ),
                Text("last update:${widget.lastUpdateDate}",textScaleFactor:0.8,style:TextStyle(color:Colors.grey))
              ]
            ),
            Container(color: Colors.grey,height: 2.0,),
            Container(
              padding: !ResponsiveWidget.isSmallScreen(context)?EdgeInsets.only(left: 20.0,top:20.0):null,
              // constraints: BoxConstraints.expand(height: 100),
              height:MediaQuery.of(context).size.height-(MediaQuery.of(context).size.height/4), 
              child: Column(
                children: <Widget>[
                  !scrolling?GestureDetector(
                    onVerticalDragStart: (context){
                      setState(() {
                        _scrollController.animateTo(_scrollController.position.minScrollExtent+1, duration: Duration(seconds: 3), curve: Curves.ease);
                      });
                    },
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image(height: 50.0,image: AssetImage("images/hackerRankLogo.png")),
                                Text("Badges",textScaleFactor: 1.3,style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () async{
                                    await launch("https://www.hackerrank.com/souravrawat1999");
                                  },
                                  child:Icon(Icons.link,color:Color.fromRGBO(86, 184, 88, 1.0))
                                ),
                                Text("hackerrank.com",textScaleFactor: 0.6,style:TextStyle(color:Colors.white))
                              ],
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left:40.0),
                          height: 150.0,
                          child: ListView.builder(
                            itemCount: Badges.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,i) => Row(
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      height:100,
                                      width:100,
                                      child:FloatingActionButton(
                                        onPressed: (){},
                                        elevation: 20.0,
                                        splashColor: Badges[i].backgroudColor,
                                        shape: PolygonBorder(
                                          sides: 6,
                                          borderRadius: 5.0,
                                          border: BorderSide.none,
                                        ),
                                        backgroundColor: Badges[i].backgroudColor,
                                        child: Column(
                                          mainAxisAlignment:MainAxisAlignment.center, 
                                          children:<Widget>[
                                            Image(image: AssetImage(Badges[i].pngImage),height: 30.0,),
                                            Container(height:5.0),
                                            Text(Badges[i].badgeTitle, textScaleFactor: Badges[i].isLongTitle?0.6:0.8,style: TextStyle(fontWeight: FontWeight.bold,color:Color.fromRGBO(57, 66, 78, 1.0)),),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: List.generate(Badges[i].starsCount, (context)=>
                                                Icon(Icons.star,color:Color.fromRGBO(57, 66, 78, 1.0),size: 10.0,),
                                              ),
                                            )
                                          ]
                                        ),
                                      )
                                    ),
                                    Text(Badges[i].level,textScaleFactor: 1.0,style:TextStyle(color: Color.fromRGBO(212, 141, 60, 1.0),fontFamily: "Merriweather",fontWeight: FontWeight.w500)),
                                    Row(
                                      children:<Widget>[
                                        Text(" ${Badges[i].remainPoint} ",textScaleFactor: 0.7,style:TextStyle(color: Color.fromRGBO(86, 184, 88, 1.0))),
                                        Text("points far to get ",textScaleFactor: 0.7,style:TextStyle(color: Colors.white)),
                                      ]
                                    ),
                                    Text("${Badges[i].forTask} ",textScaleFactor: 0.7,style:TextStyle(color: Badges[i].priority?Colors.white:Color.fromRGBO(212, 141, 60, 1.0),backgroundColor: Badges[i].priority?Color.fromRGBO(212, 141, 60, 1.0):Colors.transparent))
                                  ],
                                ),
                                Container(width:10.0)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ):Container(),
                  Expanded(
                    child: ResponsiveWidget.isSmallScreen(context)?
                    ListView.builder(
                      controller: _scrollController,
                      itemExtent: 270.0,
                      itemCount: certificate.length,
                      itemBuilder: (context,i)=>Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 10,
                        color: Colors.white,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: GestureDetector(
                          onTap: (){
                            popUp(certificate[i].techLogo,certificate[i].certiImage);
                          },
                          child: Stack(
                            fit: StackFit.expand,
                            alignment: Alignment.center,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  image:DecorationImage(
                                    image: AssetImage(certificate[i].techLogo),
                                  ),
                                ),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 5.0,sigmaY:5.0),
                                  child: Container(
                                    color:Colors.white.withOpacity(0.9)
                                  )
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(top:5.0,left: 5.0,right: 5.0),
                                    child: Stack( 
                                      children: <Widget>[
                                        Container(
                                          height: ResponsiveWidget.isMediumScreen(context)?MediaQuery.of(context).size.height/3.8:MediaQuery.of(context).size.height/3.3,
                                          decoration: BoxDecoration(
                                            image:certificate[i].certiImage!=""?DecorationImage(
                                              fit: BoxFit.cover, 
                                              image:AssetImage(certificate[i].certiImage),
                                            ):null,
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.only(
                                              topLeft:Radius.circular(5.0),
                                              topRight:Radius.circular(5.0),
                                            )
                                          ),
                                        ),
                                        Positioned(right: 2.0,top: 2.0,child: Icon(Icons.launch,size:15.0,color:Colors.blue))
                                      ],
                                    ),
                                  ),
                                  ListTile(
                                    leading:Image(
                                      alignment: Alignment.center,
                                      image: AssetImage(certificate[i].logo),
                                      height: 50.0,
                                      width: 50.0,
                                    ),
                                    title: Text(certificate[i].title,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(certificate[i].company,style: TextStyle(color: certificate[i].companyColor)),
                                        Text("Issued ${certificate[i].issueDate}",style: TextStyle(color:Colors.black),),
                                        certificate[i].credID!=null?FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: Text("Credential ID ${certificate[i].credID}",style: TextStyle(color:Colors.grey),),
                                        ):Container(height: 0.0,)
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ),
                    ) 
                    :GridView.builder(
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: certificate.length,
                      controller: _scrollController,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0,
                        childAspectRatio:((MediaQuery.of(context).size.width/2)/((MediaQuery.of(context).size.height)/1.2))
                        // ResponsiveWidget.isMediumScreen(context)?1.7:1.2,
                      ),
                      itemBuilder: (context,i)=>Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 10,
                        color: Colors.white,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: GestureDetector(
                          onTap: (){
                            popUp(certificate[i].techLogo,certificate[i].certiImage);
                          },
                          child: Stack(
                            fit: StackFit.expand,
                            alignment: Alignment.center,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  image:DecorationImage(
                                    image: AssetImage(certificate[i].techLogo),
                                  ),
                                ),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 5.0,sigmaY:5.0),
                                  child: Container(
                                    color:Colors.white.withOpacity(0.9)
                                  )
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(top:5.0,left: 5.0,right: 5.0),
                                    child: Stack( 
                                      children: <Widget>[
                                        Container(
                                          height: ResponsiveWidget.isMediumScreen(context)?MediaQuery.of(context).size.height/3.8:MediaQuery.of(context).size.height/3.3,
                                          decoration: BoxDecoration(
                                            image:certificate[i].certiImage!=""?DecorationImage(
                                              fit: BoxFit.cover, 
                                              image:AssetImage(certificate[i].certiImage),
                                            ):null,
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.only(
                                              topLeft:Radius.circular(5.0),
                                              topRight:Radius.circular(5.0),
                                            )
                                          ),
                                        ),
                                        Positioned(right: 2.0,top: 2.0,child: Icon(Icons.launch,size:15.0,color:Colors.blue))
                                      ],
                                    ),
                                  ),
                                  ListTile(
                                    leading:Image(
                                      alignment: Alignment.center,
                                      image: AssetImage(certificate[i].logo),
                                      height: 50.0,
                                      width: 50.0,
                                    ),
                                    title: Text(certificate[i].title,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(certificate[i].company,style: TextStyle(color: certificate[i].companyColor)),
                                        Text("Issued ${certificate[i].issueDate}",style: TextStyle(color:Colors.black),),
                                        certificate[i].credID!=null?FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: Text("Credential ID ${certificate[i].credID}",style: TextStyle(color:Colors.grey),),
                                        ):Container(height: 0.0,)
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}