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
    return Container(
      decoration: BoxDecoration(
          color: BackgroundColor,
          boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(1, 2))
      ])
      ,
      child: Material(
        type: MaterialType.transparency,
        //elevation: 6.0,
        color: Colors.transparent,
        shadowColor: Colors.grey[50],
        child: InkWell(
          onTap: (){
            print("hello world");
          },
          child: Container(


              //margin: EdgeInsets.only(top: 15, left: 20),
              //height: size.height * 0.2,
              //width: size.width * 0.42,
              child: Column(children: [
                FittedBox(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/Images/location/bana.jpg',
                    //height: size.height * 0.12457,
                  ),
                  fit: BoxFit.fill,
                ),
                Container(
                    alignment: Alignment.center,
                    //margin: EdgeInsets.only(top: size.height*0.02),
                    child: Column(
                      children: [
                        Container(
                          //color: PrimaryColor2,
                          width: size.width,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                              top: size.height * 0.006, bottom: size.height * 0.007),
                          child: Text(
                            "Bà Nà",
                            style: TextStyle(
                                color: PrimaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                            alignment: Alignment.bottomRight,
                            //color: Colors.red,
                            //width: ,
                            padding: EdgeInsets.only(right: size.width * 0.03),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 20,
                                  color: PrimaryColor2,
                                ),
                                Text(
                                  "Đà Nẵng",
                                  style: TextStyle(fontSize: 14, color: PrimaryColor),
                                )
                              ],
                            ))
                      ],
                    ))
              ])),
        ),
      ),
    );
  }
}

class TitleRecommended extends StatelessWidget {
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
      ],
    );
  }
}

class ButtonLogin extends StatefulWidget {
  @override
  _ButtonLoginState createState() => _ButtonLoginState();
}

class _ButtonLoginState extends State<ButtonLogin> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: size.height*0.07, bottom: size.height*0.1),
      child: Stack(
        alignment: Alignment.center,
          children:[

          Container(
              width: size.width*0.85,
              height: size.height*0.2,
              child: Image.asset('assets/Images/location/bana.jpg', fit: BoxFit.fitWidth,)
          ),
            Align(
              alignment: Alignment.center,
              child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: FlatButton(
                        height: 35,
                        color: PrimaryColor2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)
                        ),
                      onPressed: ()=> print("hello"),
                      child: Text("Đăng nhập",
                        style: TextStyle(color: BackgroundColor,
                          fontSize: 28
                        ),
                      ),
                  ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text("Để có thêm nhiều tính năng",style: TextStyle(color: Colors.white, fontSize: 15), ),
                      ),

                ])
            ),
        ]
      ),
    );
  }
}
