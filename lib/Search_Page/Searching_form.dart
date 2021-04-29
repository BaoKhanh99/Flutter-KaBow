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
          color: PrimaryColor.withOpacity(1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.07, vertical: size.height * 0.015),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: PrimaryColor,
                        )
                    ),
                    hintText: "Địa điểm...",
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    hintStyle: TextStyle(color: PrimaryColor.withOpacity(0.6)),
                    filled: true,
                    fillColor: BackgroundColor),
                style: TextStyle(fontSize: 15),
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: 0,
                        top: size.width * 0.03,
                        right: size.width * 0.02,
                        bottom: size.width * 0.03),
                    width: 200,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: PrimaryColor),
                                  borderRadius: BorderRadius.circular(5)),
                              hintText: "Mục đích",
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              hintStyle: TextStyle(
                                  color: PrimaryColor.withOpacity(0.6),
                                  fontSize: 14),
                              filled: true,
                              fillColor: BackgroundColor),
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width * 0.35,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: PrimaryColor),
                                  borderRadius: BorderRadius.circular(5)),
                              hintText: "Số lượng",
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 0),
                              hintStyle: TextStyle(
                                  color: PrimaryColor.withOpacity(0.6),
                                  fontSize: 15),
                              filled: true,
                              fillColor: BackgroundColor),
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: size.width,
                height: size.height * 0.05,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        backgroundColor: PrimaryColor2,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                    onPressed: () {
                      print("hello");
                    },
                    child: Text(
                      "Tìm kiếm",
                      style: TextStyle(color: BackgroundColor),
                    )),
              )
            ],
          ),
        ));
  }
}
