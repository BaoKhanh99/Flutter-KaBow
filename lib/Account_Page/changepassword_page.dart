import 'package:flutter/material.dart';
import 'package:kabow/Account_Page/login_page.dart';
import 'package:kabow/Models/user.dart';
import 'package:kabow/services/auth.dart';
import 'package:provider/provider.dart';
class changepassword_page extends StatefulWidget{
  _changepasswordState createState() => _changepasswordState();
}
class _changepasswordState extends State<changepassword_page>{
  String oldpassword = "";
  String newpassword = "";
  String renewpassword = "";
  final AuthenService _auth = AuthenService();
  final _formKey = GlobalKey<FormState>();
  bool _showoldpassword = true;
  bool _shownewpassword = true;
  bool _showrenewpassword = true;
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
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Nhập mật khẩu cũ",
                          labelText: "Mật Khẩu Cũ",
                          labelStyle:
                          TextStyle(fontSize: 18, color: Colors.black),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.remove_red_eye),
                            color: Colors.grey,
                            onPressed: () {
                              setState(() {
                                _showoldpassword = !_showoldpassword;
                              });
                            },
                          ),
                        ),
                        obscureText: _showoldpassword,
                        validator: (val) =>
                        val.length < 6 ? "Mật khẩu cũ không đúng" : null,
                        onChanged: (val) {
                          setState(() => oldpassword = val);
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Nhập mật khẩu mới",
                          labelText: "Mật Khẩu Mới",
                          labelStyle:
                          TextStyle(fontSize: 18, color: Colors.black),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.remove_red_eye),
                            color: Colors.grey,
                            onPressed: () {
                              setState(() {
                                _shownewpassword = !_shownewpassword;
                              });
                            },
                          ),
                        ),
                        obscureText: _shownewpassword,
                        validator: (val) =>
                        val.length < 6 ? "Cần ít nhất 6 kí tự" : null,
                        onChanged: (val) {
                          setState(() => newpassword = val);
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Nhập lại mật khẩu mới",
                          labelText: "Xác Nhận Mật Khẩu Mới",
                          labelStyle:
                          TextStyle(fontSize: 18, color: Colors.black),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.remove_red_eye),
                            color: Colors.grey,
                            onPressed: () {
                              setState(() {
                                _showrenewpassword = !_showrenewpassword;
                              });
                            },
                          ),
                        ),
                        obscureText: _showrenewpassword,
                        validator: (val) =>
                        val != newpassword
                            ? "Mật khẩu không trùng khớp"
                            : null,
                        onChanged: (val) {
                          setState(() => renewpassword = val);
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
                height:20,
              ),
              Center(
                child: Container(
                    child:RaisedButton(
                      onPressed: (){},
                      color: Color(0xffc5400c),
                      padding:  EdgeInsets.symmetric(horizontal: 70),
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child:
                      Text("XÁC NHẬN",
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