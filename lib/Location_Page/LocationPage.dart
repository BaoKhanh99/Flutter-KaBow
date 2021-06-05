import 'dart:ui';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kabow/Colors/ProjectColor.dart';
import 'package:kabow/Models/Location.dart';
import 'package:kabow/Location_Page/CommentLocationPage.dart';
import 'package:kabow/Models/LocationServices.dart';
import 'package:kabow/Service_Page/ServiceDetail.dart';
import 'package:kabow/providers/ServiceProvider.dart';
import 'package:provider/provider.dart';

class LocationPage extends StatefulWidget {
  final Location location;
  //List<String> a = [];
  LocationPage({this.location});
  //LocationPage({Key key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => ServiceProvider(),
      child: Scaffold(
          body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text("${widget.location.title}"),
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
                    onPressed: () {},
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
                              builder: (context) => CommentLocationPage(
                                  location: widget.location)));
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
                    onPressed: () {},
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
                    child: ImageCarousel(
                      images: widget.location.images,
                    ))),
            SliverToBoxAdapter(
                child: LocationInformation(
              location: widget.location,
            )),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Các dịch vụ sẵn có",
                  style: TextStyle(
                      color: PrimaryColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ServiceRecommended(
              provinceId: widget.location.provinceId,
            )
          ],
        ),
      )),
    );
  }
}

class ImageCarousel extends StatefulWidget {
  List images;
  ImageCarousel({this.images});

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  @override
  Widget build(BuildContext context) {
    return Carousel(
      dotSize: 5,
      dotBgColor: Colors.transparent,
      //animationDuration: Duration.(milliseconds: 300),
      autoplay: false,
      autoplayDuration: Duration.zero,
      images: [
        Image.network(
          widget.images[0],
          //"assets/Images/location/bana.jpg",
          fit: BoxFit.cover,
        ),
        Image.network(
          widget.images[1],
          fit: BoxFit.cover,
        ),
        Image.network(
          widget.images[2],
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class LocationInformation extends StatelessWidget {
  Location location;

  LocationInformation({this.location});
  //const LocationInformation({Key key}) : super(key: key);

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
              "${location.detail}",
              style: TextStyle(
                fontSize: 17,
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
                    "${location.province}",
                    style: TextStyle(
                      fontSize: 17,
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

class ServiceRecommended extends StatefulWidget {
  final String provinceId;
  ServiceRecommended({this.provinceId});

  @override
  _ServiceRecommendedState createState() => _ServiceRecommendedState();
}

//get recommended service
class _ServiceRecommendedState extends State<ServiceRecommended> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //print(widget.provinceId);
    final serviceProvider = Provider.of<ServiceProvider>(context);
    serviceProvider.setProvinceId = widget.provinceId;
    return StreamBuilder(
        stream: serviceProvider.getRecommendedService,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<LocationService> locationServices = snapshot.data;
            return SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: size.height * 0.15,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: locationServices.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ServiceDetail(
                                      locationService: locationServices[index],
                                    )));
                      },
                      child: Container(
                        padding: EdgeInsets.only(right: 10),
                        width: size.width * 0.5,
                        //color: Colors.red,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.network(
                              "${locationServices[index].images[0]}",
                              fit: BoxFit.cover,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: size.height * 0.095),
                              height: 100,
                              color: BackgroundColor.withOpacity(0.6),
                              alignment: Alignment.center,
                              child: Text(
                                "${locationServices[index].name}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: PrimaryColor,
                                    fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          } else {
            print("${snapshot.error}");
            return SliverToBoxAdapter(
              child: Container(
                child: Text("sssss"),
              ),
            );
          }
        });
  }
}
