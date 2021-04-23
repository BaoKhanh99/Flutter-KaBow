import 'package:flutter/material.dart';


class Searching_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
            automaticallyImplyLeading: false, // hides leading widget
            flexibleSpace: Container(
              alignment: Alignment.center,
              child: Image.asset('assets/logo.png',height: 70,),
              margin: const EdgeInsets.only(top: 40),

              //color: Colors.orange,

            ) ,
            backgroundColor: Colors.white,
//          centerTitle: true,
//          title: Image.asset('assets/logo.png',height: 100,)
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
