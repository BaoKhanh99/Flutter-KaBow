import 'package:flutter/material.dart';
import 'package:kabow/Colors/ProjectColor.dart';
import 'package:kabow/Search_Page/Recommended.dart';
import 'package:kabow/Search_Page/Searching_form.dart';

class Searching_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    child: Image.asset('assets/logo.png',
                        height: size.height * 0.1),
                  ),
                ],
              ),
              backgroundColor: Colors.white,
            )),
        body:
            CustomScrollView(slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              child: Searching_form(),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: size.height * 0.05),
              alignment: Alignment.topLeft,
              child: TitleRecommended(),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(20),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Recommended();
                },
                childCount: 10,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: size.height * 0.015,
                crossAxisSpacing: size.width * 0.03,
                //childAspectRatio: (5/5),
              ),
            ),
          ),
              SliverToBoxAdapter(
                child: ButtonLogin(),
              )
        ]
            )
    );
  }
}
