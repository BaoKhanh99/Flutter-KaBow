import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kabow/Colors/ProjectColor.dart';

class CommentLocationPage extends StatefulWidget {
  CommentLocationPage({Key key}) : super(key: key);

  @override
  _CommentLocationPageState createState() => _CommentLocationPageState();
}

class _CommentLocationPageState extends State<CommentLocationPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Bình luận về địa điểm"),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 90,
                    child: TextField(
                      style: TextStyle(fontSize: 18),
                      decoration: new InputDecoration(
                          contentPadding: EdgeInsets.only(
                              left: 5, right: 5, bottom: 5, top: 5.0),
                          border: OutlineInputBorder(
                              borderSide: new BorderSide(
                                  width: 1,
                                  color: PrimaryColor.withOpacity(0.1))),
                          filled: true,
                          fillColor: BackgroundColor,
                          hintText: "Nhập bình luận..."),
                      maxLines: 5,
                    ),
                  ),
                  Expanded(
                    flex: 15,
                    child: Container(
                      //width: size,
                      //color: Colors.red,
                      child: TextButton(
                        onPressed: () {
                          print("object");
                        },
                        child: Icon(
                          FontAwesomeIcons.solidPaperPlane,
                          size: size.width * 0.1,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                padding: EdgeInsets.all(10),
                //height: 50,
                //color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tên người bình luận",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Divider(
                      endIndent: size.width * 0.05,
                      height: 4,
                      color: PrimaryColor,
                      thickness: 2,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 7),
                      width: size.width * 0.9,
                      height: 100,
                      color: PrimaryColor.withOpacity(0.1),
                      child: Text(
                        "Đây là dòng bình luận siêu dài, dài lắm luôn ă",
                        style: TextStyle(fontSize: 17),
                      ),
                    )
                  ],
                ),
              );
            }, childCount: 10),
          )
        ],
      ),
    );
  }
}
