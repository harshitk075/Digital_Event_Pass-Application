import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  double _screenHeight,_screenWidth;
  @override
  Widget build(BuildContext context) {
    _screenHeight=MediaQuery.of(context).size.height;
    _screenWidth=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Stack(
        children: <Widget>[ Scaffold(
          backgroundColor: Colors.grey[100],
          body: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              alignment: Alignment.bottomCenter,

              child: Image.asset('assets/homeback.png'),
            ),
          ),
       ),
          CustomPaint(
            size: Size(_screenWidth,_screenHeight),
            painter: ShapePainter(),
          ),
          Container(
            margin: EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Theme.of(context).accentColor,
                  elevation: 6,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      Navigator.pushNamed(context, "/organizerPage");
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(30, 15, 0.0, 10),
                      height:100.0,
                      child :Row(
                          children: <Widget>[Icon(Icons.business_center, size: 70,
                            color: Colors.brown[800],),
                            SizedBox(
                              width: 15.0,
                            ),
                            Text('ORGANIZE AN \nEVENT', style: TextStyle(
                                color: Colors.brown[800],
                                fontWeight: FontWeight.w800,
                                fontSize: 20
                            ),
                            ),
                          ]),
                    ),
                  ),
                ),
                SizedBox(height: 18.0),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Theme.of(context).accentColor,
                  elevation: 6,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      Navigator.pushNamed(context, "/userPage");
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(30, 15, 15, 15),
                      height:100.0,
                      child :Row(

                          children: <Widget>[Icon(Icons.event, size: 70,
                            color: Colors.brown[800],),
                            SizedBox(
                              width: 15.0,
                            ),
                            Text('EXPLORE EVENTS', style: TextStyle(
                                color: Colors.brown[800],
                                fontWeight: FontWeight.w800,
                                fontSize: 20
                            ),
                            ),
                          ]),
                    ),
                  ),
                ),
              ],

            ),
          ),

      ],),
    );
  }
}
class ShapePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    paint.color= Colors.blue[300];
    paint.style= PaintingStyle.fill;
    var path = Path();


    path.moveTo(0, size.height*0.05);
    path.lineTo(size.width *0.11, size.height *0.22);
    path.quadraticBezierTo(size.width *0.13, size.height *0.25,size.width*0.18, size.height * 0.24);
    path.quadraticBezierTo(size.width *0.13, size.height *0.25,size.width*0.18, size.height * 0.24);
    path.lineTo(size.width*0.95, size.height * 0.07);
    path.quadraticBezierTo(size.width, size.height *0.05,size.width*0.98, size.height * 0.02);
    path.lineTo(size.width*0.96, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}