import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:kabow/Favorite_Page/FavoritePage.dart';
import 'package:kabow/providers/LocationProvider.dart';
import 'package:provider/provider.dart';
import 'Search_Page/Searching_Page.dart';
import 'Account_Page/Account_Page.dart';
import 'Service_Page/Service_Page.dart';
import 'Colors/ProjectColor.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KaBow',
      theme: ThemeData(
        primarySwatch: PrimaryColor,
      ),
      home: MyHomePage(title: 'KaBow App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  List<Widget> _listbtngbar = [
    SearchingPage(),
    Service_Page(),
    FavoritePage(),
    Acount_Page(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocationProvider(),
      child: Scaffold(
        body: _listbtngbar[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.search),
              title: Text('Search'),
              backgroundColor: Colors.orange,
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.key),
              title: Text('Reserve'),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.solidHeart),
              title: Text('Favorite'),
              backgroundColor: Colors.orange,
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.solidUser),
              title: Text('Account'),
              backgroundColor: Colors.orange,
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
