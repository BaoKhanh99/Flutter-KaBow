import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class LocationPage extends StatefulWidget {
  LocationPage({Key key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text("Tên Địa điểm"),
            ),
            SliverToBoxAdapter(
                child: Container(
              height: 250,
              width: size.width,
              child: Carousel(
                dotSize: 5,
                dotBgColor: Colors.transparent,
                animationDuration: Duration(seconds: 0),
                images: [
                  Image.asset(
                    "assets/Images/location/bana.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/Images/location/bana.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/Images/location/bana.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/Images/location/bana.jpg",
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            )),
            SliverToBoxAdapter(child: LocationInformation())
          ],
        ),
      ),
    );
  }
}

class LocationInformation extends StatelessWidget {
  const LocationInformation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Thông tin địa điểm: ",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              "Đây là thông tin chi tiết về địa điểm",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Địa chỉ:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Đây là thông tin địa chỉ",
                    style: TextStyle(
                      fontSize: 15,
                      //fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              )),
          Container(
              child: RaisedButton(
            child: Text("tìm kiếm cách dịch vụ"),
          ))
        ],
      ),
    );
  }
}
