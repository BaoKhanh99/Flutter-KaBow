import 'dart:ui';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kabow/Colors/ProjectColor.dart';
import 'package:kabow/Models/Location.dart';
import 'package:kabow/Location_Page/CommentLocationPage.dart';
import 'package:kabow/Models/LocationServices.dart';
import 'package:kabow/Service_Page/dropdownService.dart';
import 'package:kabow/providers/ServiceProvider.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class ServiceDetail extends StatefulWidget {
  final LocationService locationService;
  ServiceDetail({this.locationService});

  @override
  _ServiceDetailState createState() => _ServiceDetailState();
}

class _ServiceDetailState extends State<ServiceDetail> {
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
            //appbar
            SliverAppBar(
              title: Text("${widget.locationService.name}"),
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

            //image service
            SliverToBoxAdapter(
                child: Container(
                    height: 250,
                    width: size.width,
                    child: ImageCarousel(
                      images: widget.locationService.images[0],
                    ))),

            //service infor
            SliverToBoxAdapter(
                child: ServiceInformation(
              locationService: widget.locationService,
            )),

            //dich vu khac
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Các dịch vụ khác",
                  style: TextStyle(
                      color: PrimaryColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //service recommended
            ServiceRecommended(
              provinceId: widget.locationService.provinceId,
              id: widget.locationService.id,
            )
          ],
        ),
      )),
    );
  }
}

//list images
class ImageCarousel extends StatefulWidget {
  String images;
  ImageCarousel({this.images});

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  @override
  Widget build(BuildContext context) {
    return Carousel(
      dotSize: 0,
      dotBgColor: Colors.transparent,
      //animationDuration: Duration.(milliseconds: 300),
      autoplay: false,
      autoplayDuration: Duration.zero,
      images: [
        Image.network(
          "${widget.images}",
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}

//service infor
// ignore: must_be_immutable
class ServiceInformation extends StatefulWidget {
  final LocationService locationService;
  ServiceInformation({this.locationService});
  @override
  _ServiceInformationState createState() => _ServiceInformationState();
}

class _ServiceInformationState extends State<ServiceInformation> {
  List<Bed> _bed = Bed.getBed();
  List<DropdownMenuItem<Bed>> _dropdownBedItem;
  Bed _selectedBed;

  List<Time> _time = Time.getTime();
  List<DropdownMenuItem<Time>> _dropdownTimeItem;
  Time _selectedTime;

  CreateAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text("Xác nhận thanh toán"),
              content: Text(
                  "Bạn đồng thanh toán khoản tiền $totalPrice phải không? "),
              actions: [
                FlatButton(
                    onPressed: () => print("Yes"), child: Text("Đồng ý")),
                FlatButton(
                    onPressed: () => Navigator.pop(context), child: Text("Huỷ"))
              ]);
        });
  }

  final myController = TextEditingController();

  int totalPrice = 0;

  @override
  void initState() {
    //myController.text = "aaaaaa";

    _dropdownBedItem = buildDropdownBedItem(_bed);
    _selectedBed = _dropdownBedItem[0].value;

    _dropdownTimeItem = buildDropdownTimeItem(_time);
    _selectedTime = _dropdownTimeItem[0].value;

    myController.addListener(calculate);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    myController.dispose();
    super.dispose();
  }

  void calculate() {
    int room = int.parse(myController.text);
    int price = 0;
    if (_selectedBed.id == 1) {
      if (_selectedTime.id == 1) {
        price = widget.locationService.price['1b-night'];
      } else {
        price = widget.locationService.price['1b-allDay'];
      }
    } else {
      if (_selectedTime.id == 1) {
        price = widget.locationService.price['2b-night'];
      } else {
        price = widget.locationService.price['2b-allDay'];
      }
    }
    setState(() {
      totalPrice = room * price;
    });
  }

  List<DropdownMenuItem<Bed>> buildDropdownBedItem(List beds) {
    List<DropdownMenuItem<Bed>> items = List();
    for (Bed bed in beds) {
      print(bed.name);
      items.add(
        DropdownMenuItem(
          value: bed,
          child: Text(bed.name),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<Time>> buildDropdownTimeItem(List alltime) {
    List<DropdownMenuItem<Time>> items = List();
    for (Time time in alltime) {
      print(time.name);
      items.add(
        DropdownMenuItem(
          value: time,
          child: Text(time.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownBedItem(Bed selectedBed) {
    setState(() {
      _selectedBed = selectedBed;
    });
  }

  onChangeDropdownTimeItem(Time selectedTime) {
    setState(() {
      _selectedTime = selectedTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String foodService =
        widget.locationService.foodService == true ? "có" : "không";
    String washingMachine =
        widget.locationService.washingMachine == true ? "có" : "không";
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Thông tin: ",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),

          //infor about service
          Container(
            padding: const EdgeInsets.only(top: 8),
            //color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Máy giặt: $washingMachine",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                Text(
                  "Đồ ăn: $foodService",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),

          //service address
          Container(
              width: size.width * 0.9,
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Địa chỉ:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      "${widget.locationService.address['street']}, ${widget.locationService.address['district']}, ${widget.locationService.address['province']}",
                      style: TextStyle(
                        fontSize: 17,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )),

          //factor
          Container(
              width: size.width * 0.9,
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  //number bed field
                  Flexible(
                      flex: 25,
                      child: TextFormField(
                        controller: myController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Số phòng",
                            prefixStyle: TextStyle(
                                color: PrimaryColor,
                                fontWeight: FontWeight.bold),
                            contentPadding: EdgeInsets.only(top: 1, left: 10),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: PrimaryColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)))),
                      )),

                  //bed field
                  Flexible(
                    flex: 40,
                    child: Container(
                      //width: size.width * 0.48,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: BackgroundColor),
                      child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                        value: _selectedBed,
                        items: _dropdownBedItem,
                        onChanged: onChangeDropdownBedItem,
                        style: TextStyle(
                          color: PrimaryColor,
                          fontSize: 15,
                        ),
                        dropdownColor: BackgroundColor,
                      )),
                    ),
                  ),

                  //time field
                  Flexible(
                    flex: 30,
                    child: Container(
                      //width: size.width * 0.48,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: BackgroundColor),
                      child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                        value: _selectedTime,
                        items: _dropdownTimeItem,
                        onChanged: onChangeDropdownTimeItem,
                        style: TextStyle(
                          color: PrimaryColor,
                          fontSize: 15,
                        ),
                        dropdownColor: BackgroundColor,
                      )),
                    ),
                  )
                ],
              )),

          //total price
          Center(
            heightFactor: size.height * 0.004,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Tổng thanh toán: ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "$totalPrice đ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ]),
          ),

          Center(
              child: Container(
            width: size.width * 0.7,
            height: size.height * 0.05,
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: PrimaryColor2,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)))),
                onPressed: () {
                  CreateAlertDialog(context);
                }
                //kiem tra ng dung da nhap muc dich chua
                ,
                child: Text(
                  "Xác nhận",
                  style: TextStyle(color: BackgroundColor, fontSize: 20),
                )),
          ))
        ],
      ),
    );
  }
}

class ServiceRecommended extends StatefulWidget {
  final String provinceId;
  final int id;
  ServiceRecommended({this.provinceId, this.id});

  @override
  _ServiceRecommendedState createState() => _ServiceRecommendedState();
}

class _ServiceRecommendedState extends State<ServiceRecommended> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final serviceProvider = Provider.of<ServiceProvider>(context);
    serviceProvider.setProvinceId = widget.provinceId;
    serviceProvider.setId = widget.id;
    return StreamBuilder(
        stream: serviceProvider.getRecommendedServiceExceptSameDoc,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<LocationService> locationServices = snapshot.data;

            if (locationServices.length == 0) {
              return SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.only(top: size.height * 0.05),
                  child: Center(
                    child: Text("không có dịch vụ phù hợp"),
                  ),
                ),
              );
            } else {
              return SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: size.height * 0.15,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: locationServices.length,
                    itemBuilder: (context, index) {
                      return Container(
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
                      );
                    },
                  ),
                ),
              );
            }
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
