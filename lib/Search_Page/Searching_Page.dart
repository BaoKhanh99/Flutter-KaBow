import 'package:flutter/material.dart';


class Searching_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Image.asset('assets/logo.png',height: 100,),
        )
      ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Searching Page ',
              ),
            ],
          ),
        ),
    );
  }
}
