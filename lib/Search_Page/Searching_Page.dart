import 'package:flutter/material.dart';
import 'package:kabow/Colors/ProjectColor.dart';
import 'package:kabow/Models/Location.dart';
import 'package:kabow/Search_Page/Recommended.dart';
import 'package:kabow/Search_Page/Searching_form.dart';
import 'package:kabow/providers/LocationProvider.dart';
import 'package:provider/provider.dart';

class SearchingPage extends StatefulWidget {
  @override
  _SearchingPageState createState() => _SearchingPageState();
}

class _SearchingPageState extends State<SearchingPage> {
  @override
  Widget build(BuildContext context) {
    String namePage = context.widget.toStringShort();
    Size size = MediaQuery.of(context).size;
    final locationProvider = Provider.of<LocationProvider>(context);

    return Scaffold(
      //app bar
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.width * 0.3),
          child: AppBar(
            automaticallyImplyLeading: false, // hides leading widget
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.03),
                  child:
                      Image.asset('assets/logo.png', height: size.height * 0.1),
                ),
              ],
            ),
            backgroundColor: BackgroundColor,
          )),
      //body
      body: CustomScrollView(
        slivers: [
          //searching form
          SliverToBoxAdapter(
            child: Searching_form(
              namePage: namePage,
            ),
          ),

          // title recommended
          SliverToBoxAdapter(
            child: TitleRecommended(),
          ),
          StreamBuilder<List<Location>>(
              stream: locationProvider.locations,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return SliverToBoxAdapter(
                    child: Text("no data ${snapshot.error}"),
                  );
                } else {
                  //recommeneded location list
                  return SliverGrid(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return Recommended(
                          location: snapshot.data[index],
                        );
                      }, childCount: 6),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 1,
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        mainAxisSpacing: 1,
                      ));
                }
              }),

          //button login
          SliverToBoxAdapter(
            child: ButtonLogin(),
          )
        ],
      ),
    );
  }
}
