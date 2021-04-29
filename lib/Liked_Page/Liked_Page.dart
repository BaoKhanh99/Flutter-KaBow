
import 'package:flutter/material.dart';


class Liked_Page extends StatelessWidget {
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
            Expanded(
                child: SizedBox(
                  height: 300,
                  child: ListView(
                    children: [
                      ListTile(
                        title: Text("data"),
                      ),
                      ListTile(
                        title: Text("data"),
                      ),
                      ListTile(
                        title: Text("data"),
                      )
                    ],
                  ),
                )

            )
          ],
        ),
      ),
    );
  }
}