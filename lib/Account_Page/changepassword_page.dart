import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kabow/Account_Page/login_page.dart';
import 'package:kabow/Colors/ProjectColor.dart';
import 'package:kabow/Models/user.dart';
import 'package:kabow/services/auth.dart';
import 'package:provider/provider.dart';
class changepassword_page extends StatefulWidget{
  _changepasswordState createState() => _changepasswordState();
  TextEditingController controller = TextEditingController();
}
class _changepasswordState extends State<changepassword_page>{
  String oldpassword = "";
  String newpassword = "";
  String renewpassword = "";
  String email ="";
  final AuthenService _auth = AuthenService();
  final _formKey = GlobalKey<FormState>();
  String _email;
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
                    "ĐẶT LẠI MẬT KHẨU",
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
                            hintText: "Email",
                            labelText: "Hãy nhập email",
                            labelStyle:
                            TextStyle(fontSize: 18, color: Colors.black)),
                        validator: (val) =>
                        val.isEmpty ? "Hãy nhập email của bạn" : null,
                        onChanged: (val) {
                          setState(() => _email = val);
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
                      onPressed: ()async{
                        if(_formKey.currentState.validate()){
                          _auth.sendPasswordResetEmail(_email);
                          AlertDialog(
                            title: Text("Vui lòng kiểm tra mail của bạn"),
                            content: Text("Quay lại trang đăng nhập"),
                            actions: [
                              FlatButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("Không"),
                              ),
                              FlatButton(
                                //color: PrimaryColor2,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                },
                                child: Text("Có",),
                              ),
                            ],
                          );
                        }else{
                          print("Email không đúng");
                        }
                      },
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
                    ),

                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Center(
                child: Container(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              login_page()));
                    },
                    child: Text(
                      "Quay lại trang đăng nhập",
                      style: TextStyle(
                          fontSize: 18,
                          color: PrimaryColor,
                          ),
                    ),
                  ),
                ),
              )

            ],),),
        ],
      ),
    );
  }

}