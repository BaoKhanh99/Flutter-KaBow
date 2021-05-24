import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kabow/Colors/ProjectColor.dart';
import 'package:kabow/Models/Location.dart';
import 'package:kabow/Models/comments.dart';
import 'package:kabow/providers/LocationProvider.dart';
import 'package:kabow/providers/commentProvider.dart';
import 'package:provider/provider.dart';

class CommentLocationPage extends StatefulWidget {
  final Location location;
  CommentLocationPage({this.location});

  @override
  _CommentLocationPageState createState() => _CommentLocationPageState();
}

class _CommentLocationPageState extends State<CommentLocationPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) {
        return CommentProvider();
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text("Bình luận về ${widget.location.title}"),
            ),
            //user comments here
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
            //commented list
            CommentedList(
              provinceId: widget.location.provinceId,
              locationId: widget.location.locationId,
              people: widget.location.people,
            )
          ],
        ),
      ),
    );
  }
}

class CommentedList extends StatefulWidget {
  final String locationId;
  final String provinceId;
  final String people;

  CommentedList({this.provinceId, this.locationId, this.people});

  @override
  _CommentedListState createState() => _CommentedListState();
}

class _CommentedListState extends State<CommentedList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final commentProvider = Provider.of<CommentProvider>(context);

    commentProvider.setLocationId = widget.locationId;
    commentProvider.setProvinceId = widget.provinceId;
    commentProvider.setPeople = widget.people;
    print("ppppppppppppppppppppppp ${widget.people}");
    return StreamBuilder(
        stream: commentProvider.getComments,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return SliverToBoxAdapter(
              child: Center(
                child: Text(snapshot.error),
              ),
            );
          } else {
            List<Comment> comments = snapshot.data;
            //print("aaaaaaaaa ${snapshot.data.toString()}");
            return SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${comments[index].user['name']}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
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
                          "${comments[index].comment}",
                          style: TextStyle(fontSize: 17),
                        ),
                      )
                    ],
                  ),
                );
              }, childCount: 1),
            );
          }
        });
  }
}
