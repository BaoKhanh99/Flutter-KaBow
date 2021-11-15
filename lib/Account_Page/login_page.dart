import 'package:flutter/material.dart';
import 'package:kabow/Account_Page/changepassword_page.dart';
import 'package:kabow/Account_Page/getpassword_page.dart';
import 'package:kabow/Account_Page/register_page.dart';
import 'package:kabow/Colors/ProjectColor.dart';
import 'package:kabow/Models/user.dart';
import 'package:kabow/services/auth.dart';

class login_page extends StatefulWidget {
  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<login_page> {
  final AuthenService _auth = AuthenService();
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool _showpassword = true;
  String error = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: size.height * 0.03),
              child: Image.asset("assets/logo.png", height: size.height * 0.1),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Center(
                    child: Text(
                      "ĐĂNG NHẬP",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1b2536),
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "Nhập email",
                              labelText: "Email",
                              labelStyle:
                                  TextStyle(fontSize: 18, color: Colors.black)),
                          validator: (val) =>
                              val.isEmpty ? "Enter a email" : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Nhập mật khẩu",
                            labelText: "Mật Khẩu",
                            labelStyle:
                                TextStyle(fontSize: 18, color: Colors.black),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              color: Colors.grey,
                              onPressed: () {
                                setState(() {
                                  _showpassword = !_showpassword;
                                });
                              },
                            ),
                          ),
                          obscureText: _showpassword,
                          validator: (val) =>
                              val.length < 6 ? "Cần ít nhất 6 kí tự" : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                      child: RaisedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        print(email);
                        dynamic result =
                            await _auth.signInEmailAndPassword(email, password);
                        if (result == null) {
                          setState(() => error = "Không thể đăng nhập");
                        } else {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        }
                      }
                    },
                    color: PrimaryColor2,
                    padding: EdgeInsets.symmetric(horizontal: 80),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      "ĐĂNG NHẬP",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        letterSpacing: 2.2,
                      ),
                    ),
                  )),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Center(
                  child: Text(
                    error,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Bạn chưa có tài khoản? ",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  register_page()));
                        },
                        child: Text(
                          "Đăng ký",
                          style: TextStyle(
                              fontSize: 18,
                              color: PrimaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Container(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              changepassword_page()));
                    },
                    child: Text(
                      "Quên mật khẩu ?",
                      style: TextStyle(
                          fontSize: 18,
                          color: PrimaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildContainer(String labeltext) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          labelText: labeltext,
        ),
      ),
    );
  }
}
