import 'package:flutter/material.dart';


class Acount_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        title: Image.asset('assets/logo.png',height: 100,),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Account Page',
            ),
          ],
        ),
      ),
    );
  }
}