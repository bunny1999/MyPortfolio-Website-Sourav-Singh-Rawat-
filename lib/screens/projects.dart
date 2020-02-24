import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:myPortfolioNew/model/projectModel.dart';
import 'package:myPortfolioNew/responsive_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Projects extends StatefulWidget {
  String lastUpdateDate;
  Projects(this.lastUpdateDate);
  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  // int currentSlideIndex=1;
  int currentSlideIndex=0;
  ScrollController _scrollController;

  List<bool> isWatched;

  @override
  void initState(){
    super.initState();
    
    isWatched=List.filled(projectList.length, false);
    
    _scrollController=ScrollController();
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

  
  GlobalKey popUpKey=new GlobalKey();
  

  void popUp(String image,String title,String desc,String link){
    showDialog(
      context:context,
      builder: (BuildContext context){
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(10.0),
          ),
          contentPadding: EdgeInsets.all(0.0),
          titlePadding: EdgeInsets.all(0.0),
          content: Container(
            key: popUpKey,
            width: MediaQuery.of(context).size.width-(MediaQuery.of(context).size.width/4),
            height: MediaQuery.of(context).size.height-(MediaQuery.of(context).size.height/3),
            color: Colors.white,
            child: Column(
              children:<Widget>[
                Container(
                  height: MediaQuery.of(context).size.height-(MediaQuery.of(context).size.height/2),
                  decoration: BoxDecoration(
                    color:Colors.grey,
                    // image: DecorationImage(
                    //  image: AssetImage(),
                    //  fit: BoxFit.cover  
                    // )
                  ),
                ),
                SizedBox(height: 8.0,),
                ListTile(
                  leading:CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("images/gitHubLogo.png"),
                    maxRadius: 30,
                  ),
                  title: Text(title,textScaleFactor: 1.5,style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                  subtitle: GestureDetector(
                    onTap: () async{
                      await launch(link);
                    },
                    child: Text(link,style: TextStyle(decoration: TextDecoration.underline,decorationColor:Colors.blue,color:Colors.blue),)),
                  trailing: IconButton(icon: Icon(Icons.link),color: Colors.blue, onPressed: ()async{
                    await launch(link);
                  }),
                )
              ]
            ),
          )
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
                    Text("Projects",textScaleFactor:2.6,style:TextStyle(fontWeight: FontWeight.bold)),
                    Icon(Icons.scatter_plot,color: Colors.deepOrange,)
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
                children:<Widget>[
                // !scrolling?GestureDetector(
                //   onVerticalDragStart: (context){
                //     _scrollController.animateTo(_scrollController.position.minScrollExtent+1, duration: Duration(seconds:3), curve: Curves.ease);
                //   },
                //   child: Container(
                //     padding: EdgeInsets.only(bottom:10.0),
                //     child: Stack(
                //       children: <Widget>[
                //         Container(
                //           // padding: EdgeInsets.only(left:200.0,right:200.0),
                //           child: CarouselSlider(
                //             enlargeCenterPage: true,
                //             autoPlay: true,
                //             pauseAutoPlayOnTouch: Duration(minutes: 1),
                //             items:List<Widget>.generate(projectList.length, (index){
                //               return Container(
                //                 color: Colors.grey
                //               );
                //             }),
                //             height: MediaQuery.of(context).size.height/2,
                //             onPageChanged: (index){
                //                setState(() {
                //                 currentSlideIndex=index+1;
                //               });
                //             },
                //           ),
                //         ),
                //         Positioned(
                //           bottom: 4.0,
                //           left: MediaQuery.of(context).size.width/3,
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: List<Widget>.generate(projectList.length, (index){
                //               return Row(
                //                 children: <Widget>[
                //                   currentSlideIndex-1==index?OrangeDot():GreyDot(),
                //                   SizedBox(width:5.0),
                //                 ],
                //               );
                //             })
                //           ),
                //         )
                //       ],
                //     ),
                //   ),
                // ):Container(),
                Expanded(
                  child:ResponsiveWidget.isSmallScreen(context)? 
                  ListView.builder(
                    controller: _scrollController,
                    itemCount: projectList.length,
                    itemBuilder: (context,i){
                      return GestureDetector(
                        onTap: ()async{
                          setState(() {
                            isWatched[i]=true;
                          });
                          await launch(projectList[i][3]);
                          // popUp(projectList[i][0],projectList[i][1],projectList[i][2],projectList[i][3]);
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius:BorderRadius.circular(20.0),
                          ),
                          // color: currentSlideIndex-1==i?Colors.orange:isWatched[i]?Colors.blue:Colors.white,
                          color: isWatched[i]?Colors.orange:Colors.white,
                          child: Column(
                            children:<Widget>[
                              Container(height:3),
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  maxRadius: 30.0,
                                  backgroundImage:AssetImage("images/gitHubLogo.png"),
                                ),
                                title: Text(projectList[i][1],textScaleFactor: 1.3,style: TextStyle(color:currentSlideIndex-1==i || isWatched[i]?Colors.white:Colors.black,fontWeight: FontWeight.bold),),
                                subtitle: Text(projectList[i][2], textScaleFactor: 0.8,style: TextStyle(color:currentSlideIndex-1==i || isWatched[i]?Colors.white54:Colors.grey),),
                                trailing: IconButton(
                                  icon: Icon(Icons.launch,color: currentSlideIndex-1==i || isWatched[i]?Colors.white:Colors.blue,), 
                                  onPressed: ()async{
                                    await launch(projectList[i][3]);
                                  })
                              ),
                              Container(height:3.0),
                              Container(height:2.0,color: currentSlideIndex-1==i || isWatched[i]?Colors.white:Colors.grey,),
                              Container(
                                padding: EdgeInsets.only(left:3.0),
                                alignment: Alignment.topLeft,
                                child: Wrap(
                                  spacing:2.0,
                                  runSpacing:1.0,
                                  direction:Axis.horizontal,
                                  children:List.generate(projectList[i][4].length, (index){
                                    return Chip(
                                      avatar: CircleAvatar(backgroundColor: Colors.white,backgroundImage: projectList[i][4][index][0]!=""?AssetImage(projectList[i][4][index][0]):null,),
                                      label: Text(projectList[i][4][index][1],style: TextStyle(fontStyle:FontStyle.italic),),
                                      backgroundColor: currentSlideIndex-1==i || isWatched[i]?Colors.white:null,
                                    );
                                  })
                                ),
                              )
                            ]
                          ),
                        ),
                      );
                    }, 
                  )
                  :StaggeredGridView.countBuilder(
                    crossAxisCount: 3,
                    controller: _scrollController,
                    itemCount: projectList.length, 
                    itemBuilder: (context,i){
                      return GestureDetector(
                        onTap: ()async{
                          setState(() {
                            isWatched[i]=true;
                          });
                          await launch(projectList[i][3]);
                          // popUp(projectList[i][0],projectList[i][1],projectList[i][2],projectList[i][3]);
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius:BorderRadius.circular(20.0),
                          ),
                          // color: currentSlideIndex-1==i?Colors.orange:isWatched[i]?Colors.blue:Colors.white,
                          color: isWatched[i]?Colors.blue:Colors.white,
                          child: Column(
                            children:<Widget>[
                              Container(height:3),
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  maxRadius: 30.0,
                                  backgroundImage:AssetImage("images/gitHubLogo.png"),
                                ),
                                title: Text(projectList[i][1],textScaleFactor: 1.3,style: TextStyle(color:currentSlideIndex-1==i || isWatched[i]?Colors.white:Colors.black,fontWeight: FontWeight.bold),),
                                subtitle: Text(projectList[i][2], textScaleFactor: 0.8,style: TextStyle(color:currentSlideIndex-1==i || isWatched[i]?Colors.white54:Colors.grey),),
                                trailing: IconButton(
                                  icon: Icon(Icons.launch,color: currentSlideIndex-1==i || isWatched[i]?Colors.white:Colors.blue,), 
                                  onPressed: ()async{
                                    await launch(projectList[i][3]);
                                  })
                              ),
                              Container(height:3.0),
                              Container(height:2.0,color: currentSlideIndex-1==i || isWatched[i]?Colors.white:Colors.grey,),
                              Container(
                                padding: EdgeInsets.only(left:3.0),
                                alignment: Alignment.topLeft,
                                child: Wrap(
                                  spacing:2.0,
                                  runSpacing:1.0,
                                  direction:Axis.horizontal,
                                  children:List.generate(projectList[i][4].length, (index){
                                    return Chip(
                                      avatar: CircleAvatar(backgroundColor: Colors.white,backgroundImage: projectList[i][4][index][0]!=""?AssetImage(projectList[i][4][index][0]):null,),
                                      label: Text(projectList[i][4][index][1],style: TextStyle(fontStyle:FontStyle.italic),),
                                      backgroundColor: currentSlideIndex-1==i || isWatched[i]?Colors.white:null,
                                    );
                                  })
                                ),
                              )
                            ]
                          ),
                        ),
                      );
                    }, 
                    staggeredTileBuilder: (int index) =>
                    new StaggeredTile.fit(1),
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 10.0,
                  )
                )
                ]
              ),
            )
          ]
        )
      )
    );
  }
}

class GreyDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8.0,
      height: 8.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );
  }
}

class OrangeDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12.0,
      height: 12.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(212, 141, 60, 1.0),
      ),
    );
  }
}