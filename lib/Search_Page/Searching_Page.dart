import 'package:flutter/material.dart';
import 'package:kabow/Search_Page/Recommended.dart';
import 'package:kabow/Search_Page/Searching_form.dart';

class Searching_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.width*0.3),
        child: AppBar(
            automaticallyImplyLeading: false, // hides leading widget
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(

                  margin: EdgeInsets.only(top: size.height*0.03),
                  child: Image.asset('assets/logo.png',height: size.height*0.1),
                ),
              ],
            ) ,
            
            backgroundColor: Colors.white,
        )
      ),
        body:
          SingleChildScrollView(

            child: Column(

              children: [
                Container(
                  alignment: Alignment.center,
                  child: Searching_form(),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height*0.05),
                  alignment: Alignment.topLeft,
                  child: Recommended(),
                )
              ],
            ),
          )
    );
  }
}
