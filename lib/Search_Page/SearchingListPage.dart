import 'package:flutter/material.dart';
import 'package:kabow/Colors/ProjectColor.dart';
import 'package:kabow/Models/Location.dart';
import 'package:kabow/Search_Page/LocationItem.dart';
import 'package:kabow/Search_Page/Searching_form.dart';
import 'package:kabow/providers/LocationProvider.dart';
import 'package:provider/provider.dart';

class SearchingListPage extends StatefulWidget {
  final province;
  final purpose;
  final numberPeople;
  SearchingListPage({this.province, this.purpose, this.numberPeople});

  @override
  _SearchingListPageState createState() => _SearchingListPageState();
}

class _SearchingListPageState extends State<SearchingListPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //print(widget.numberPeople);
    return ChangeNotifierProvider(
      create: (context) => LocationProvider(),
      child: Scaffold(
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
                  sliver: LocationList(
                    province: widget.province,
                    numberPeople: widget.numberPeople,
                    purpose: widget.purpose,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class LocationList extends StatefulWidget {
  final province;
  final numberPeople;
  final purpose;
  LocationList({this.province, this.numberPeople, this.purpose});
  @override
  _LocationListState createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {
  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);
    Size size = MediaQuery.of(context).size;

    locationProvider.setProvince = widget.province;
    locationProvider.setPeople = widget.numberPeople;
    locationProvider.setPurpose = widget.purpose;
    return StreamBuilder(
        stream: locationProvider.searchingQuery,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Location> locationList = snapshot.data;
            //searching location list
            return SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) {
                return LocationItem(
                  location: locationList[index],
                );
              },
              childCount: locationList.length,
            ));
          } else {
            print(snapshot.error);
            return SliverToBoxAdapter(child: Text("${snapshot.error}"));
          }
        });
  }
}
