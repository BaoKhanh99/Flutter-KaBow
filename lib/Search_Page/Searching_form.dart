import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kabow/Colors/ProjectColor.dart';
class Searching_form extends StatefulWidget {
  @override
  _SearchingState createState() => _SearchingState();
}

class _SearchingState extends State<Searching_form> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        alignment: Alignment.center,
          decoration: BoxDecoration(
            color: BackgroundPrimaryColor.withOpacity(1),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),

        child:
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(

              children: [

                  TextFormField(
                      decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: PrimaryColor),
                          borderRadius: BorderRadius.circular(50)

                      ),
                      hintText: "ĐỊA ĐIỂM",
                        contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                      hintStyle: TextStyle( color: PrimaryColor.withOpacity(0.6)),
                      filled: true,
                  //fillColor: Colors.red
                  ),
                  style: TextStyle(fontSize: 15),
                  ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 0, top: 10, right: 10, bottom: 10),
                      width: 200,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(

                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: PrimaryColor),
                                borderRadius: BorderRadius.circular(50)
                              ),
                              hintText: "Mục đích",
                              contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                              hintStyle: TextStyle( color: PrimaryColor.withOpacity(0.6), fontSize: 14),
                              filled: false,
                              //fillColor: Colors.red
                            ),
                            style: TextStyle(
                                fontSize: 18
                            ),
                          ),


                        ],
                      ),
                    ),
                    Container(
                      width: size.width/3.5,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: PrimaryColor),
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              hintText: "Số lượng",
                              contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                              hintStyle: TextStyle( color: PrimaryColor.withOpacity(0.6),fontSize: 14),
                              filled: true,
                              //fillColor: Colors.red
                            ),
                            style: TextStyle(
                                fontSize: 18
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: size.width,
                  child: OutlinedButton(

                      style: OutlinedButton.styleFrom(
                        backgroundColor: PrimaryColor ,
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50)))
                      ),
                      onPressed: (){},
                      child: Text("Tìm kiếm", style: TextStyle(
                        color: Colors.white
                      ),)
                  ),
                )

              ],
            ),
          )
      );

  }
}
