import 'package:flutter/material.dart';
import 'package:grocery_app/home.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  int _selectedInex = 2;
  var screens = [
      Container(),
      Container(),
      HomeScreen(),
      Container(),
      Container(),
  ];


  Widget bottomNavBar(){
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40)
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedInex,
        onTap: (index) => setState(() => _selectedInex = index),
        backgroundColor: Colors.white,
        selectedIconTheme: IconThemeData(color: Colors.lightGreen[600]),
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        items: [
            BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                  color: _selectedInex == 0 ? Colors.lightGreen[300] : Colors.transparent,
                  borderRadius: BorderRadius.circular(12)
                ),
                  padding: const EdgeInsets.all(6),
                child: Icon(Icons.search_outlined)),
              label: ''
            ),
            BottomNavigationBarItem(
              icon: Container(
                 decoration: BoxDecoration(
                  color: _selectedInex == 1 ? Colors.lightGreen[300] : Colors.transparent,
                  borderRadius: BorderRadius.circular(12)
                ),
                  padding: const EdgeInsets.all(6),
                child: Icon(Icons.notifications_outlined)),
               label: ''
            ),
            BottomNavigationBarItem(
              icon: Container(
                 decoration: BoxDecoration(
                  color: _selectedInex == 2 ? Colors.lightGreen[300] : Colors.transparent,
                  borderRadius: BorderRadius.circular(12)
                ),
                padding: const EdgeInsets.all(6),
                child: Icon(Icons.home_outlined)),
               label: ''
            ),
            BottomNavigationBarItem(
              icon: Container(
                 decoration: BoxDecoration(
                  color: _selectedInex == 3 ? Colors.lightGreen[300] : Colors.transparent,
                  borderRadius: BorderRadius.circular(12)
                ),
                  padding: const EdgeInsets.all(6),
                child: Icon(Icons.favorite_outline)),
               label: ''
            ),
            BottomNavigationBarItem(
              icon: Container(
                 decoration: BoxDecoration(
                  color: _selectedInex == 4 ? Colors.lightGreen[300] : Colors.transparent,
                  borderRadius: BorderRadius.circular(12)
                ),
                  padding: const EdgeInsets.all(6),
                child: Icon(Icons.work_outline)),
               label: ''
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

   

    return Scaffold(
      body: Stack(
        children: [
          screens[_selectedInex],
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: bottomNavBar()
        
        
          )
        ],
      ),
    );
  }
}