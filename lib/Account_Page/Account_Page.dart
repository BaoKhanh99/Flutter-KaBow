import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kabow/Account_Page/ProfileEdit_Page.dart';
import 'package:kabow/Account_Page/login_page.dart';
import 'package:kabow/Colors/ProjectColor.dart';

class Acount_Page extends StatefulWidget {
  @override
  _Acount_PageState createState() => _Acount_PageState();
}

class _Acount_PageState extends State<Acount_Page> {
  bool _Show = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * 0.13,
        backgroundColor: BackgroundColor,
        centerTitle: true,
        title: Image.asset(
          'assets/logo.png',
          height: 100,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Color(0xff1b2536),
                ),
                SizedBox(
                  width: 7,
                ),
                Text(
                  "TÀI KHOẢN",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
              color: Color(0xff1b2536),
            ),
            SizedBox(
              height: 10,
            ),
            Visibility(
              visible: !_Show,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => ProfileEdit_page()));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "THÔNG TIN TÀI KHOẢN",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Color(0xff1b2536),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: !_Show,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => login_page()));
//                showDialog(
//                    context: context,
//                    builder: (BuildContext context) {
//                      return AlertDialog(
//                        title: Text("ĐỔI MẬT KHẨU"),
//                        content: Column(
//                          mainAxisSize: MainAxisSize.min,
//                          children: [
//                            Text("OP1"),
//                            Text("OP2"),
//                            Text("OP3"),
//                            Text("OP4"),
//                          ],
//                        ),
//                        actions: [
//                          FlatButton(
//                            onPressed: () {
//                              Navigator.of(context).pop();
//                            },
//                            child: Text("Close"),
//                          ),
//                        ],
//                      );
//                    });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ĐỔI MẬT KHẨU",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Color(0xff1b2536),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _Show,
              child: Center(
                child: RaisedButton(
                  color: Color(0xff1b2536),
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => login_page()));
                    setState(() {
                      _Show = !_Show;
                    });
                  },
                  child: Text(
                    "ĐĂNG NHẬP",
                    style: TextStyle(
                        fontSize: 16, letterSpacing: 2.2, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Icon(
                  Icons.settings,
                  color: Color(0xff1b2536),
                ),
                SizedBox(
                  width: 7,
                ),
                Text(
                  "CÀI ĐẶT",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
              color: Color(0xff1b2536),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "DARK MODE",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87),
                ),
                Transform.scale(
                    scale: 0.7,
                    child: CupertinoSwitch(
                        value: true,
                        activeColor: Colors.black87,
                        onChanged: (bool val) {})),
              ],
            ),

            //language
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          "NGÔN NGỮ",
                          style: TextStyle(color: Colors.black87),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("English"),
                            Text("Tiếng Việt"),
                            Text("中国人"),
                          ],
                        ),
                        actions: [
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Close"),
                          ),
                        ],
                      );
                    });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "NGÔN NGỮ",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Color(0xff1b2536),
                    ),
                  ],
                ),
              ),
            ),

            //help
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("TRỢ GIÚP"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("OP1"),
                            Text("OP2"),
                            Text("OP3"),
                            Text("OP4"),
                          ],
                        ),
                        actions: [
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Close"),
                          ),
                        ],
                      );
                    });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "TRỢ GIÚP",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.black87,
                    ),
                  ],
                ),
              ),
            ),

            //version
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("PHIÊN BẢN"),
                        content: Text("Phiên bản: kabow.1.1"),
                        actions: [
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Close"),
                          ),
                        ],
                      );
                    });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "PHIÊN BẢN",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.black87,
                    ),
                  ],
                ),
              ),
            ),

            //Privacy Policy
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("CHÍNH SÁCH BẢO MẬT"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("OP1"),
                            Text("OP2"),
                            Text("OP3"),
                            Text("OP4"),
                          ],
                        ),
                        actions: [
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Close"),
                          ),
                        ],
                      );
                    });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "CHÍNH SÁCH BẢO MẬT",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Color(0xff1b2536),
                    ),
                  ],
                ),
              ),
            ),

            //legal information
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("THÔNG TIN PHÁP LÝ"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("OP1"),
                            Text("OP2"),
                            Text("OP3"),
                            Text("OP4"),
                          ],
                        ),
                        actions: [
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Close"),
                          ),
                        ],
                      );
                    });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "THÔNG TIN PHÁP LÝ",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Color(0xff1b2536),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Visibility(
              visible: !_Show,
              child: Center(
                child: RaisedButton(
                  color: Color(0xff1b2536),
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
                    setState(() {
                      _Show = !_Show;
                    });
                  },
                  child: Text(
                    "ĐĂNG XUẤT",
                    style: TextStyle(
                        fontSize: 16, letterSpacing: 2.2, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
