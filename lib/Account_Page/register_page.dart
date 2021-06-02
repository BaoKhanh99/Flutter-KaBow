import 'package:flutter/material.dart';
import 'package:kabow/Account_Page/login_page.dart';

class register_page extends StatefulWidget{
  @override
  _registerpageState createState() => _registerpageState();
}
class _registerpageState extends State<register_page>{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
    slivers: [
      SliverAppBar(
//          title: Text("ĐĂNG KÝ"),
        ),
      SliverToBoxAdapter(
        child: Container(
          margin: EdgeInsets.only(top: size.height * 0.03),
          child: Image.asset("assets/logo.png", height: size.height * 0.1),
        ),
      ),
      SliverList(
        delegate: SliverChildListDelegate([
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
            child:

            Center(
              child: Text(
                "ĐĂNG KÝ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1b2536),
                  fontSize: 20,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          buildContainer("Họ và tên"),
          buildContainer("Email"),
          buildContainer("Nhập mật khẩu"),
          buildContainer("Nhập lại mật khẩu"),
          SizedBox(
            height:20,
          ),
          Center(
            child: Container(
                child:RaisedButton(
                  onPressed: (){},
                  color: Color(0xff1b2536),
                  padding:  EdgeInsets.symmetric(horizontal: 80),
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child:
                  Text("ĐĂNG KÝ",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      letterSpacing: 2.2,
                    ),),
                )
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
                  "Bạn đã có tài khoản? ",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => login_page()));
                  },
                  child: Text(
                    "Đăng nhập",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],),),
    ],
    ),
    );
  }
  Container buildContainer(String labeltext) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      child: TextField(
        decoration: InputDecoration(
          labelText: labeltext,
        ),
      ),
    );
  }
}