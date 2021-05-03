import 'package:flutter/material.dart';
import 'package:kabow/Colors/ProjectColor.dart';
import 'package:kabow/Search_Page/LocationList.dart';
import 'package:kabow/Search_Page/Searching_form.dart';

class SearchingListPage extends StatefulWidget {
  @override
  _SearchingListPageState createState() => _SearchingListPageState();
}

class _SearchingListPageState extends State<SearchingListPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: BackgroundColor,
              expandedHeight: 300,
              floating: true,
              pinned: true,
              toolbarHeight: size.height * 0.11,
              title: Image.asset(
                'assets/Images/logo.png',
                height: size.height * 0.09,
              ),
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.none,
                background: Container(
                    margin: EdgeInsets.only(top: size.height * 0.11),
                    child: Searching_form()),
              ),
              automaticallyImplyLeading: false,
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 10),
              sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return LocationList();
                },
                childCount: 10,
              )),
            )
          ],
        ),
      ),
    );
  }
}

class LocationList extends StatefulWidget {
  LocationList({Key key}) : super(key: key);

  @override
  _LocationListState createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
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
              child: Image.asset("assets/Images/location/bana.jpg",
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
                        "Tên địa điểm",
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
                                "địa chỉ",
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
    );
  }
}
