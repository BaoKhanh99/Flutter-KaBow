import 'package:flutter/material.dart';
import 'package:kabow/Colors/ProjectColor.dart';
import 'package:kabow/Models/Location.dart';
import 'package:kabow/Location_Page/LocationPage.dart';
import 'package:kabow/Models/LocationServices.dart';
import 'package:kabow/Service_Page/ServiceDetail.dart';

class ServiceItem extends StatefulWidget {
  final LocationService locationService;
  ServiceItem({this.locationService});

  @override
  _ServiceItemState createState() => _ServiceItemState();
}

class _ServiceItemState extends State<ServiceItem> {
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
                  builder: (context) => ServiceDetail(
                        locationService: widget.locationService,
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
                  child: Image.network("${widget.locationService.images[0]}",
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
                            "${widget.locationService.name}",
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
                                    "${widget.locationService.address['province']}",
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
