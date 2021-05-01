
import 'package:flutter/material.dart';
import 'package:kabow/Colors/ProjectColor.dart';
import 'package:kabow/Search_Page/Recommended.dart';
import 'package:kabow/Search_Page/Searching_form.dart';

class Searching_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //List<String> images = ["https://placeimg.com/500/500/any", "https://placeimg.com/500/500/any", "https://placeimg.com/500/500/any", "https://placeimg.com/500/500/any", "https://placeimg.com/500/500/any"];

    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
            backgroundColor: Colors.white,
          )),
      body:
//

//        Searching_form(),
//        TitleRecommended(),

//        Expanded(
//      child: GridView.builder(
//      itemCount: 11,
//        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//            crossAxisCount: 2,
//            crossAxisSpacing: 4.0,
//            mainAxisSpacing: 4.0
//        ),
//        itemBuilder: (
//            BuildContext context, int index){
//
//          return Container(child: Text("Ssssssssssssssssssssss"),);
//        },
//      ),
//    ),
          CustomScrollView(
            
        slivers: [
          SliverToBoxAdapter(
            child: Searching_form(),
          ),
          SliverToBoxAdapter(
            child: TitleRecommended(),
          ),
          SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Recommended();
              }, childCount: 20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 1,
                crossAxisCount: 2,
                childAspectRatio: 1,
                mainAxisSpacing: 1,
              )),
          SliverToBoxAdapter(
            child: ButtonLogin(),
          )
        ],
      ),
    );
  }
}
