import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kabow/Account_Page/ProfileEdit_Page.dart';
import 'package:kabow/Account_Page/login_page.dart';
import 'package:kabow/Colors/ProjectColor.dart';
import 'package:kabow/Models/user.dart';
import 'package:kabow/services/Service.dart';
import 'package:kabow/services/auth.dart';
import 'package:provider/provider.dart';

class Acount_Page extends StatefulWidget {
  @override
  _Acount_PageState createState() => _Acount_PageState();
}

class _Acount_PageState extends State<Acount_Page> {
  bool _showLogin = true;
  AuthenService authenService = AuthenService();
  @override
  Widget build(BuildContext context) {
    final authenticatedProvider = Provider.of<Users>(context);
    String a;
    Widget getUserName;
    if (authenticatedProvider == null) {
      _showLogin = true;
    } else {
      _showLogin = false;
      a = authenticatedProvider.uid;
      getUserName = GetUserName(
        uid: a,
      );
    }
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
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.01,
                  bottom: size.height * 0.03,
                  left: size.height * 0.01),
              child: getUserName,
            ),

            //account
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

            //info account
            Visibility(
              visible: !_showLogin,
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

            //change password
            Visibility(
              visible: !_showLogin,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => login_page()));
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

            //sign in
            Visibility(
              visible: _showLogin,
              child: Center(
                child: RaisedButton(
                  color: PrimaryColor2,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => login_page()));
                    setState(() {
                      _showLogin = _showLogin;
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

            //settings
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

            //list settings
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
                        activeColor: PrimaryColor,
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

            //sign out
            Visibility(
              visible: !_showLogin,
              child: Center(
                child: RaisedButton(
                  color: PrimaryColor2,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () async {
                    await authenService.signOut();
                    print("object");
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

class GetUserName extends StatefulWidget {
  final String uid;
  GetUserName({this.uid});

  @override
  _GetUserNameState createState() => _GetUserNameState();
}

class _GetUserNameState extends State<GetUserName> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Service(uid: widget.uid).getUserData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container(
            child: Text('${snapshot.error}'),
          );
        } else {
          UserData userData = snapshot.data;
          return Container(
            child: Text("${userData.name}"),
          );
        }
      },
    );
  }
}
