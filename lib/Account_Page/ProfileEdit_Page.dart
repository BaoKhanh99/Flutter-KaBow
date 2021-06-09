import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kabow/Colors/ProjectColor.dart';
import 'package:kabow/Models/user.dart';
import 'package:kabow/services/Service.dart';

import 'package:kabow/services/auth.dart';
import 'package:provider/provider.dart';

class ProfileEdit_page extends StatefulWidget {
  @override
  ProfileEdit_pageState createState() => ProfileEdit_pageState();
}

class ProfileEdit_pageState extends State<ProfileEdit_page> {
  bool _enemail = false;
  bool _enname = false;
  bool _ennumber = false;
  bool _enlocation = false;
  bool _ennamsinh = false;
  bool _showedit = false;
  final AuthenService _auth = AuthenService();
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String name = "";
  int sodienthoai = 0123456789;
  String diachi = "";
  String error = "";
  int namsinh = 1990;

  successUpdateAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(title: Text("Bạn đã cập nhật thành công!"),
              //content: Text("Bạn cần đăng nhập để thực hiện dịch vụ này "),
              actions: [
                FlatButton(
                    color: PrimaryColor2,
                    onPressed: () {
                      setState(() {});
                      Navigator.of(context).pop();
                    },
                    child: Text("Tiếp tục")),
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    String uid = Provider.of<Users>(context).uid;
    return StreamBuilder(
      stream: Service(uid: uid).getUserData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData userData = snapshot.data;
          if (userData != null) {
            return Scaffold(
              body: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: Text("Thông tin tài khoản"),
                  ),
                  SliverToBoxAdapter(
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.only(left: 15, top: 25, right: 16),
                        child: Stack(
                          children: [
                            Container(
                              width: 130,
                              height: 130,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 4,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      spreadRadius: 2,
                                      blurRadius: 10,
                                      color: Colors.black.withOpacity(0.1),
                                      offset: Offset(0, 10),
                                    ),
                                  ],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/Images/meo4.jpg"),
                                  )),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Opacity(
                                opacity: !_showedit ? 0 : 1,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Color(0xff1b2536),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 4,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                                  ),
                                  child: IconButton(
                                    padding: EdgeInsets.only(left: 1),
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    SizedBox(height: size.height * 0.015),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(Icons.account_circle),
                                SizedBox(
                                  width: size.width * 0.7,
                                  child: TextFormField(
                                    enabled: _enname,
                                    decoration: InputDecoration(
                                      hintText: "${userData.name}",
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      labelText: "Họ và tên",
                                      labelStyle: TextStyle(
                                        color: Color(0xff1b2536),
                                        fontSize: 18,
                                      ),
                                      hintStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff1b2536),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 2.0,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xff1b2536),
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                    validator: (val) => val.length < 6
                                        ? "Cần ít nhất 6 kí tự"
                                        : null,
                                    onChanged: (val) {
                                      setState(() => name = val);
                                    },
                                  ),
                                ),
                                Opacity(
                                  opacity: !_showedit ? 0 : 1,
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _enname = !_enname;
                                        });
                                      },
                                      icon: Icon(Icons.edit)),
                                )
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.015,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(Icons.phone),
                                SizedBox(
                                  width: size.width * 0.7,
                                  child: TextFormField(
                                    enabled: _ennumber,
                                    decoration: InputDecoration(
                                      hintText: "${userData.phoneNumber}",
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      labelText: "Số điện thoại",
                                      labelStyle: TextStyle(
                                        color: Color(0xff1b2536),
                                        fontSize: 18,
                                      ),
                                      hintStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff1b2536),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 2.0,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xff1b2536),
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                    validator: (val) => val.length < 6
                                        ? "Cần ít nhất 6 kí tự"
                                        : null,
                                    onChanged: (val) {
                                      setState(
                                          () => sodienthoai = int.parse(val));
                                    },
                                  ),
                                ),
                                Opacity(
                                  opacity: !_showedit ? 0 : 1,
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _ennumber = !_ennumber;
                                        });
                                      },
                                      icon: Icon(Icons.edit)),
                                )
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.015,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(Icons.add_location_sharp),
                                SizedBox(
                                  width: size.width * 0.7,
                                  child: TextFormField(
                                    enabled: _enlocation,
                                    decoration: InputDecoration(
                                      hintText: "${userData.address}",
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      labelText: "Địa chỉ",
                                      labelStyle: TextStyle(
                                        color: Color(0xff1b2536),
                                        fontSize: 18,
                                      ),
                                      hintStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff1b2536),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 2.0,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xff1b2536),
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                    validator: (val) => val.length < 6
                                        ? "Cần ít nhất 6 kí tự"
                                        : null,
                                    onChanged: (val) {
                                      setState(() => diachi = val);
                                    },
                                  ),
                                ),
                                Opacity(
                                  opacity: !_showedit ? 0 : 1,
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _enlocation = !_enlocation;
                                        });
                                      },
                                      icon: Icon(Icons.edit)),
                                )
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.015,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(Icons.calendar_today_sharp),
                                SizedBox(
                                  width: size.width * 0.7,
                                  child: TextFormField(
                                    enabled: _ennamsinh,
                                    decoration: InputDecoration(
                                      hintText: "${userData.yob}",
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      labelText: "Năm sinh",
                                      labelStyle: TextStyle(
                                        color: Color(0xff1b2536),
                                        fontSize: 18,
                                      ),
                                      hintStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff1b2536),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 2.0,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xff1b2536),
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                    validator: (val) => val.length < 6
                                        ? "Cần ít nhất 6 kí tự"
                                        : null,
                                    onChanged: (val) {
                                      setState(() => namsinh = int.parse(val));
                                    },
                                  ),
                                ),
                                Opacity(
                                  opacity: !_showedit ? 0 : 1,
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _ennamsinh = !_ennamsinh;
                                        });
                                      },
                                      icon: Icon(Icons.edit)),
                                )
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.015,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: _showedit,
                      child: Container(
                        alignment: Alignment.center,
                        margin:
                            EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RaisedButton(
                              onPressed: () {
                                setState(() {
                                  _showedit = !_showedit;
                                });
                              },
                              color: Color(0xff1b2536),
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "HUỶ BỎ",
                                style: TextStyle(
                                    fontSize: 14,
                                    letterSpacing: 2.2,
                                    color: Colors.white),
                              ),
                            ),
                            RaisedButton(
                              onPressed: () async {
                                await Service(uid: uid).updateUserData(
                                    name, namsinh, diachi, sodienthoai);
                                successUpdateAlertDialog(context);
                              },
                              color: Color(0xffc5400c),
                              padding: EdgeInsets.symmetric(horizontal: 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "LƯU",
                                style: TextStyle(
                                    fontSize: 14,
                                    letterSpacing: 2.2,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: !_showedit,
                      child: Center(
                        child: RaisedButton(
                          onPressed: () {
                            setState(() {
                              _showedit = !_showedit;
                            });
                          },
                          color: Color(0xffc5400c),
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "CHỈNH SỬA THÔNG TIN",
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ]))
                ],
              ),
            );
          } else {
            return Container();
          }
        } else {
          return Container();
        }
      },
    );
  }
}
