import 'package:flutter/material.dart';
import 'package:grocery_app/home.dart';
import 'package:grocery_app/nav_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardScreen extends StatefulWidget {
  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  PageController _controller;


  @override
  void initState() { 
    super.initState();
    _controller = PageController();
  }


  Widget page1(){
    return Container(
      color: Colors.lightGreen[400],
      padding: EdgeInsets.symmetric(vertical: 56.0, horizontal: 24.0),
      child: Column(
        children: [
          SizedBox(width: 70, height: 70,
          child: Image.asset('assets/images/bok-choy.png', color: Colors.white,)),
          SizedBox(height: 16),
          Text('FRESHOP', style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            letterSpacing: 5.0
            
          )),
          SizedBox(
            height: 400,
            child: ShaderMask(
              child: Image.asset('assets/images/woman.png'),
              blendMode: BlendMode.dstIn,
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black, Colors.transparent
                  ]
                ).createShader(Rect.fromLTRB(0, 200, rect.width, rect.height - 40));
              },
            ),
          ),
          Text(
            'Discover Grocery \nand Food',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white
            )
          ),
          SizedBox(height: 16),
          Text('If you eat fresh foods that you have a living energy,\nthe food returns that living energy.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
  Widget page2(){
     return Container(
      color: Colors.lightGreen[400],
      child: Center(
        child: Text('Screen2', style: TextStyle(color: Colors.white, fontSize: 18.0),),
      ),
    );
  }
    Widget page3(){
    return Container(
      color: Colors.lightGreen[400],
      child: Stack(
        children: [
          Center(
            child: Text('Screen3', style: TextStyle(color: Colors.white, fontSize: 18.0),),
          ),
          Positioned(
            right: 24.0,
            bottom: 45,
            child: Container(
              width: 120,
              child: RaisedButton(
                onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavBar()));
                },
                elevation: 0,
                color: Colors.lightGreen[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)
                ),
                child: Text('Get start', style: TextStyle(
                  color: Colors.white,
                  fontSize: 16
                ),),
              )
            ),
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              page1(),
              page2(),
              page3()
            ],
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 56,
            child: Center(
              child: SmoothPageIndicator(
                count: 3,
                 controller: _controller,
                 effect: ExpandingDotsEffect(
                   expansionFactor: 2,
                   dotHeight: 10.0,
                   dotWidth: 10.0,
                   activeDotColor: Colors.white,
                   dotColor: Colors.grey[200]
                 ),
              ),
            ),
          )
        ],
      ),
    );
  }
}