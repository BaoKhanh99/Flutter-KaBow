import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kabow/Colors/ProjectColor.dart';
import 'package:kabow/Models/Location.dart';
import 'package:kabow/Search_Page/LocationItem.dart';
import 'package:kabow/Location_Page/LocationPage.dart';

class FavoriteItem extends StatefulWidget {
  // final Location location;

  // LocationItem({this.location});

  @override
  _FavoriteItemState createState() => _FavoriteItemState();
}

class _FavoriteItemState extends State<FavoriteItem> {
  bool isFavorite = false;
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
                      //location: widget.location,
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
              //image
              Expanded(
                flex: 4,
                child: Container(
                  //color: Colors.blue,
                  padding: EdgeInsets.all(10),
                  height: size.height * 0.14,
                  child: Image.asset('assets/Images/location/bana.jpg',
                      fit: BoxFit.cover),
                ),
              ),

              //title and province
              Expanded(
                flex: 4,
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
                            "title",
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
                                    "địa điểm",
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
              ),

              //favorite Button
              Expanded(
                flex: 2,
                child: Container(
                  height: size.height * 0.14,
                  //color: PrimaryColor2,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (isFavorite == false) {
                          isFavorite = true;
                          //print("object");
                        } else {
                          isFavorite = false;
                          print("dm");
                        }
                      });
                    },
                    icon: (isFavorite)
                        ? Icon(
                            FontAwesomeIcons.heart,
                            color: PrimaryColor2,
                          )
                        : Icon(
                            FontAwesomeIcons.solidHeart,
                            color: PrimaryColor2,
                          ),
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
