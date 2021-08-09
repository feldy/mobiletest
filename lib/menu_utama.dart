import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';

import 'package:mobiletest/menu_akun.dart';
import 'package:mobiletest/menu_cari.dart';
import 'package:mobiletest/menu_cart.dart';
import 'package:mobiletest/menu_home.dart';

class MenuUtama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circular Bottom Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(title: 'circular_bottom_navigation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  int selectedPos = 0;
  double bottomNavBarHeight = 60;
  late CircularBottomNavigationController _navigationController;
  // Read the latest value

  // int latest = _navigationController.value;

  List<TabItem> tabItems = List.of([
    new TabItem(Icons.home, "Home", Colors.black12),
    new TabItem(Icons.search, "Cari Obat", Colors.black12),
    new TabItem(Icons.shopping_cart, "Keranjang", Colors.black12),
    new TabItem(Icons.account_circle_rounded, "Akun", Colors.black12),
  ]);

  final List<Widget> _childrenPage = [
      MenuHome(),
      MenuCari(),
      MenuCart(),
      MenuAkun()
  ];

  @override
  void initState() {
    super.initState();
    _navigationController = new CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Padding(child: bodyContainer(), padding: EdgeInsets.only(bottom: bottomNavBarHeight),),
          Padding(child: MenuHome(), padding: EdgeInsets.only(bottom: bottomNavBarHeight),),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );


  }

  Widget bodyContainer() {
    Color selectedColor = tabItems[selectedPos].circleColor;

    return GestureDetector(
      child: _childrenPage[selectedPos],
      /*child: Container(
        width: double.infinity,
        height: double.infinity,
        color: selectedColor,
        child: Center(
          child: Text(
            slogan,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),*/
      onTap: () {},
    );
  }
  Widget bottomNav() {
    int lastValue = _navigationController.value;

    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      barHeight: bottomNavBarHeight,
      barBackgroundColor: Colors.white,
      animationDuration: Duration(milliseconds: 300),
      selectedCallback: (int selectedPos) {
          this.selectedPos = selectedPos;
          // print(">>>> selectedPos "+ selectedPos.toString());

          if (selectedPos == 1) { //cari
            Navigator.push(context, MaterialPageRoute(builder: (context) => MenuCari()));

            print(">>>> lastValue "+ lastValue.toString());
          } else {
            lastValue = _navigationController.value;
          }

          _navigationController.value = lastValue;
        // setState(() {
        //   this.selectedPos = selectedPos;
        //   // print(_navigationController.value);
        // });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}