import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kabow/Colors/ProjectColor.dart';
import 'package:kabow/Search_Page/CommentLocationPage.dart';

class LocationPage extends StatefulWidget {
  LocationPage({Key key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //FirebaseFirestore firestore = FirebaseFirestore.instance;
    //CollectionReference location = firestore.collection('location');

    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("title"),
            actions: [
              PopupMenuButton(itemBuilder: (context) {
                return <PopupMenuEntry>[
                  new PopupMenuItem(
                      child: new TextButton(
                          onPressed: () => print("report"),
                          child: new Text("report")))
                ];
              })
            ],
          ),
          SliverToBoxAdapter(
              child: Row(
            children: [
              Expanded(
                flex: 25,
                child: IconButton(
                  onPressed: () {
                    print("object");
                  },
                  icon: Icon(
                    FontAwesomeIcons.key,
                    color: PrimaryColor,
                  ),
                ),
              ),
              Expanded(
                flex: 25,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CommentLocationPage()));
                  },
                  icon: Icon(
                    FontAwesomeIcons.solidCommentDots,
                    color: PrimaryColor,
                  ),
                ),
              ),
              Expanded(
                flex: 25,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (isFavorite == false) {
                        isFavorite = true;
                        print("object");
                      } else {
                        isFavorite = false;
                        print("dm");
                      }
                    });
                  },
                  icon: (isFavorite)
                      ? Icon(
                          FontAwesomeIcons.heart,
                          color: PrimaryColor,
                        )
                      : Icon(
                          FontAwesomeIcons.solidHeart,
                          color: PrimaryColor,
                        ),
                ),
              ),
              Expanded(
                flex: 25,
                child: IconButton(
                  onPressed: () {
                    print("object");
                  },
                  icon: Icon(
                    FontAwesomeIcons.shareAlt,
                    color: PrimaryColor,
                  ),
                ),
              ),
            ],
          )),
          SliverToBoxAdapter(
              child: Container(
            height: 250,
            width: size.width,
            child: Carousel(
              dotSize: 5,
              dotBgColor: Colors.transparent,
              //animationDuration: Duration.(milliseconds: 300),
              autoplay: false,
              autoplayDuration: Duration.zero,
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
          SliverToBoxAdapter(child: LocationInformation()),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "Địa điểm ở quanh",
                style: TextStyle(
                    color: PrimaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: size.height * 0.15,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(right: 10),
                    width: size.width * 0.5,
                    //color: Colors.red,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          "assets/Images/location/bana.jpg",
                          fit: BoxFit.cover,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: size.height * 0.095),
                          height: 100,
                          color: BackgroundColor.withOpacity(0.6),
                          alignment: Alignment.center,
                          child: Text(
                            "tên địa điểm và tên này siêu dài",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: PrimaryColor,
                                fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    ));
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
        ],
      ),
    );
  }
}
