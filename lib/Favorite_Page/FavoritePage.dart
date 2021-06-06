import 'package:flutter/material.dart';
import 'package:kabow/Colors/ProjectColor.dart';
import 'package:kabow/Favorite_Page/favoriteItem.dart';
import 'package:kabow/Search_Page/LocationItem.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: BackgroundColor,
              //expandedHeight: 300,
              floating: true,
              pinned: true,
              toolbarHeight: size.height * 0.11,
              title: Image.asset(
                'assets/Images/logo.png',
                height: size.height * 0.09,
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
            ),
            SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 10),
                sliver: FavoriteList())
          ],
        ),
      ),
    );
  }
}

class FavoriteList extends StatefulWidget {
  FavoriteList({Key key}) : super(key: key);

  @override
  _LocationListState createState() => _LocationListState();
}

class _LocationListState extends State<FavoriteList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (context, index) {
        return FavoriteItem();
      },
      childCount: 10,
    ));
  }
}
