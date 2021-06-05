import 'package:flutter/material.dart';
import 'package:kabow/Account_Page/login_page.dart';
class getpassword_page extends StatefulWidget{
  _getpasswordState createState() => _getpasswordState();
}
class _getpasswordState extends State<getpassword_page>{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title:Text("QUAY LẠI ĐĂNG NHẬP"),
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
                  child:
                  Text(
                    "QUÊN MẬT KHẨU",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1b2536),
                      fontSize: 20,
                    ),

                  ),
                ),
              ),
              SizedBox(
                height: size.height*0.02,
              ),
              Text(
                  "Nếu bạn quên mật khẩu , hãy nhập email bạn đã đăng kí tại đây. Chúng tôi sẽ gửi mật mã mới tới email của bạn !",
              style: TextStyle(
                fontSize: 18,
              ),
                textAlign: TextAlign.center,
              ),
              buildContainer("Nhập email"),
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
                      Text("ĐẶT LẠI MẬT KHẨU",
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