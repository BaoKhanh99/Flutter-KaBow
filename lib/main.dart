import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/foundation.dart';
import 'Search_Page/Searching_Page.dart';
import 'Account_Page/Account_Page.dart';
import 'Liked_Page/Liked_Page.dart';
import 'Service_Page/Service_Page.dart';
import 'Colors/ProjectColor.dart';

void main() {
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
    Searching_Page(),
    Service_Page(),
    Liked_Page(),
    Acount_Page(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
       onTap: (index){
        setState(() {
          _currentIndex = index;
        });
       },
    ),
    );
  }
}
