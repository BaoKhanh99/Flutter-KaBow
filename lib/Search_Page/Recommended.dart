import 'package:flutter/material.dart';
import 'package:kabow/Colors/ProjectColor.dart';

class Recommended extends StatefulWidget {
  @override
  _RecommendedState createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(

      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child:
            Text("GỢI Ý", style:
            TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              backgroundColor: PrimaryColor,
              color: BackgroundPrimaryColor,
            ),
            ),

          ),

          Container(
            alignment: Alignment.topLeft,
            child: Divider(
              height: size.height*0.004,
              endIndent: size.width*0.15,
              thickness: size.width*0.01,
              color: PrimaryColor,
            ),
          )
        ],

      )
    );
  }
}
