import 'package:flutter/material.dart';
import 'package:kabow/Colors/ProjectColor.dart';
import 'package:kabow/Models/Location.dart';
import 'package:kabow/Search_Page/LocationItem.dart';
import 'package:kabow/Location_Page/LocationPage.dart';

class LocationItem extends StatefulWidget {
  final Location location;

  LocationItem({this.location});

  @override
  _LocationItemState createState() => _LocationItemState();
}

class _LocationItemState extends State<LocationItem> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      child: InkWell(
        onTap: () {
          //print("object");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LocationPage(
                        location: widget.location,
                      )));
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(color: Colors.grey),
          )),
          //margin: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  //color: Colors.blue,
                  padding: EdgeInsets.all(10),
                  height: size.height * 0.14,
                  child: Image.network(widget.location.images[0],
                      fit: BoxFit.cover),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  height: size.height * 0.14,
                  //color: PrimaryColor2,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          //color: PrimaryColor2,
                          child: Text(
                            widget.location.title,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 5,
                          child: Container(
                            alignment: Alignment.topLeft,
                            //color: PrimaryColor,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: PrimaryColor2,
                                ),
                                Flexible(
                                  //color: Colors.green,
                                  child: Text(
                                    widget.location.province,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
