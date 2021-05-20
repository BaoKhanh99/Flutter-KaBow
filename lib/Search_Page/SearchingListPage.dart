import 'package:flutter/material.dart';
import 'package:kabow/Colors/ProjectColor.dart';
import 'package:kabow/Search_Page/LocationItem.dart';
import 'package:kabow/Search_Page/Searching_form.dart';

class SearchingListPage extends StatefulWidget {
  final address;
  final purpose;
  final numberPeople;
  SearchingListPage({this.address, this.purpose, this.numberPeople});

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
                sliver: LocationList())
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
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (context, index) {
        return LocationItem();
      },
      childCount: 10,
    ));
  }
}
