
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kabow/Colors/ProjectColor.dart';

class Recommended extends StatefulWidget {
  @override
  _RecommendedState createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          height: size.height * 0.06,
          width: size.width * 0.25,
          decoration: BoxDecoration(
              color: PrimaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5))),
          margin: EdgeInsets.only(left: size.width * 0.04),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              "GỢI Ý",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                backgroundColor: PrimaryColor,
                color: BackgroundColor,
              ),
            ),
          ),
        ),
        Container(
          //color: Colors.red,
          margin: EdgeInsets.only(left: size.width * 0.04),
          alignment: Alignment.centerRight,
          child: Divider(
            height: size.height * 0.004,
            endIndent: size.width * 0.07,
            thickness: size.width * 0.01,
            color: PrimaryColor,
          ),
        ),
        Wrap(
          //alignment: WrapAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: BackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0,3)
                  )
                ]
              ),
              margin: EdgeInsets.only(top: 15, left: 20),
              height: size.height*0.2,
              width: size.width*0.42,
              child:
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child:
                        Image.asset('assets/Images/location/bana.jpg', height: size.height*0.12457,),
                    ),
                    Container(
                      alignment: Alignment.center,
                      //margin: EdgeInsets.only(top: size.height*0.02),
                      child:

                        Column(
                          children: [
                            Container(
                              //color: PrimaryColor2,
                              width: size.width,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: size.height*0.006, bottom: size.height*0.007),
                              child: Text("Bà Nà",
                                style: TextStyle(
                                    color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomRight,
                              //color: Colors.red,
                            //width: ,
                              padding: EdgeInsets.only(right: size.width*0.03),
                                child:
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(Icons.location_on ,size: 20, color: PrimaryColor2,),
                                    Text("Đà Nẵngaaaaa",
                                      style: TextStyle(
                                        fontSize: 14
                                      //color: BackgroundColor
                                    ),
                                    )
                                  ],
                                )
                            )
                          ],
                        )

                    )
                  ],
                ),
            ),
          ],
        ),
      ],


    );
  }
}
