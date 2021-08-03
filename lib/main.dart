import 'package:flutter/material.dart';
import 'package:fancy_on_boarding/fancy_on_boarding.dart';
// import 'package:mobiletest/menu_home.dart';
import 'package:mobiletest/menu_utama.dart';

void main() {
  runApp(MyApp());
  // runApp(MenuHome());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',

      //Add Route to the main Page.
      routes: {'/mainPage': (context) => MenuUtama()},
      title: 'Apotek OL',
      theme: ThemeData(primarySwatch: Colors.cyan, fontFamily: 'Nunito'),
      home: MyHomePage(title: 'Introduction'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Create a list of PageModel to be set on the onBoarding Screens.
  final pageList = [
    PageModel(
        color: const Color(0xFF7FE858),
        heroImagePath: 'assets/png/efway_logo.png',
        title: Text('Selamat Datang :)',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.black26,
              fontSize: 34.0,
            )),
        body: Text('Aplikasi Apotek Online ini bertujuan untuk memudahkan anda dalam mencari obat tanpa harus keluar rumah.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            )),
        iconImagePath: 'assets/png/shopping_cart.png'),
    PageModel(
        color: const Color(0xFF65B0B4),
        heroImagePath: 'assets/png/efway_medicine.png',
        title: Text('Obat Terlengkap',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Text(
            'Kami menyediakan Obat-obatan lengkap dan menerima pesanan resep dari dokter.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            )),
        iconImagePath: 'assets/png/wallet.png'),
    /*
    PageModel(

      color: const Color(0xFF9B90BC),
      heroImagePath: 'assets/png/stores.png',
      title: Text('Store',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontSize: 34.0,
          )),
      body: Text('All local stores are categorized for your convenience',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          )),
      icon: Icon(
        Icons.shopping_cart,
        color: const Color(0xFF9B90BC),
      ),
    ),
    // SVG Pages Example
    PageModel(
        color: const Color(0xFF678FB4),
        heroImagePath: 'assets/svg/hotel.svg',
        title: Text('Hotels SVG',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Text('All hotels and hostels are sorted by hospitality rating',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            )),
        iconImagePath: 'assets/svg/key.svg',
        heroImageColor: Colors.white),
    PageModel(
        color: const Color(0xFF65B0B4),
        heroImagePath: 'assets/svg/bank.svg',
        title: Text('Banks SVG',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Text(
            'We carefully verify all banks before adding them into the app',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            )),
        iconImagePath: 'assets/svg/cards.svg',
        heroImageColor: Colors.white),
    PageModel(
      color: const Color(0xFF9B90BC),
      heroImagePath: 'assets/svg/store.svg',
      title: Text('Store SVG',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontSize: 34.0,
          )),
      body: Text('All local stores are categorized for your convenience',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          )),
      iconImagePath: 'assets/svg/cart.svg',
    ),
     */
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      //Pass pageList and the mainPage route.
      body: FancyOnBoarding(
        doneButtonText: "Masuk",
        skipButtonText: "Skip",
        pageList: pageList,
        onDoneButtonPressed: () =>
            Navigator.of(context).pushReplacementNamed('/mainPage'),
        onSkipButtonPressed: () =>
            Navigator.of(context).pushReplacementNamed('/mainPage'),
      ),
    );
  }
}
