import 'package:flutter/material.dart';
import 'package:kabow/Account_Page/login_page.dart';
import 'package:kabow/Models/user.dart';
import 'package:provider/provider.dart';
class changepassword_page extends StatefulWidget{
  _changepasswordState createState() => _changepasswordState();
}
class _changepasswordState extends State<changepassword_page>{
  @override
  Widget build(BuildContext context) {
    bool isVisible =true;
    Size size = MediaQuery.of(context).size;
    String uid = Provider.of<Users>(context).uid;
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
//            title:Text(""),
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
                    "ĐỔI MẬT KHẨU",
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

              SizedBox(
                height:20,
              ),
              Center(
                child: Container(
                    child:RaisedButton(
                      onPressed: (){},
                      color: Color(0xffc5400c),
                      padding:  EdgeInsets.symmetric(horizontal: 80),
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child:
                      Text("Xác nhận",
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

}