import 'package:flutter/material.dart';
import 'package:kabow/Account_Page/getpassword_page.dart';
import 'package:kabow/Account_Page/register_page.dart';

class login_page extends StatefulWidget{
  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<login_page> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
//        child:
//          Center(
//            child: Visibility(
//              visible: isVisible,
//              child: RaisedButton(
//                onPressed: () => setState(() {
//                  isVisible =!isVisible;
//                },
//                ),
//                color: Color(0xff1b2536),
//                padding:  EdgeInsets.symmetric(horizontal: 80),
//                elevation: 2,
//                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//                child:
//                Text("LƯU",
//                  style: TextStyle(
//                    fontSize: 14,
//                    color: Colors.white,
//                    letterSpacing: 2.2,
//                  ),),),
//            ),
//
//          )
      slivers: [
        SliverAppBar(
//          backgroundColor: Colors.white,
//          //expandedHeight: 300,
//          floating: true,
//          pinned: true,
//          toolbarHeight: size.height * 0.11,
//          title: Image.asset(
//            'assets/Images/logo.png',
//            height: size.height * 0.09,
//          ),
//          centerTitle: true,
//          automaticallyImplyLeading: false,
//        title: Text("Đăng Nhập"),
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
              buildContainer("Email"),
              buildContainer("Nhập mật khẩu"),
              SizedBox(
                height:30,
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
                    Text("ĐĂNG NHẬP",
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
                      "Bạn chưa có tài khoản? ",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => register_page()));
                      },
                      child: Text(
                        "Đăng ký",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                        ),
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
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => getpassword_page()));
                  },
                  child: Text(
                    "Quên mật khẩu ?",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                    ),
                  ),
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
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  labelText: labeltext,
                ),
                  ),
            );
  }
}