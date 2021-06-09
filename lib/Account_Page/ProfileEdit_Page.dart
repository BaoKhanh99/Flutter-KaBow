
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kabow/Account_Page/Account_Page.dart';
import 'package:kabow/Colors/ProjectColor.dart';
import 'package:kabow/main.dart';
import 'package:kabow/services/auth.dart';

class ProfileEdit_page extends StatefulWidget{
  @override
  _ProfileEdit_pageState createState() => _ProfileEdit_pageState();
}

class _ProfileEdit_pageState extends State<ProfileEdit_page> {
  bool _enemail =false;
  bool _enname =false;
  bool _ennumber =false;
  bool _enlocation =false;
  bool _ennamsinh = false;
  final AuthenService _auth = AuthenService();
  final _formKey = GlobalKey<FormState>();
  String email ="";
  String name ="";
  int sodienthoai = 0123456789 ;
  String diachi ="";
  String error ="";
  int namsinh =1990;
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    Size size = MediaQuery.of(context).size;
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
                             color: Theme.of(context).scaffoldBackgroundColor,
                           ),
                           boxShadow: [
                             BoxShadow(
                               spreadRadius: 2, blurRadius: 10,
                               color: Colors.black.withOpacity(0.1),
                               offset: Offset(0,10),
                             ),
                           ],
                           shape: BoxShape.circle,
                           image: DecorationImage(
                             fit: BoxFit.cover,
                             image: AssetImage("assets/Images/meo4.jpg"),
                           )
                         ),
                       ),
                       Positioned(
                         bottom: 0,
                           right: 0,
                           child: Container(
                         height: 40,
                         width: 40,
                         decoration: BoxDecoration(
                           color: Color(0xff1b2536),
                           shape: BoxShape.circle,
                           border: Border.all(
                             width: 4,
                             color: Theme.of(context).scaffoldBackgroundColor,

                           ),
                         ),
                         child: IconButton(
                           padding: EdgeInsets.only(left: 1),
                          onPressed: (){},
                           icon: Icon(
                             Icons.edit,
                             color: Colors.white,
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
//                buildTextField("Họ và Tên", "Đặng Phương A", false),
//                buildTextField("Email", "dpA.17it3@vku.udn.vn",false),
//                buildTextField("Location", "U Mê Thuộc",false),
//                buildTextField("Số điện thoại", "0123456789", false),
              SizedBox(height: size.height*0.015),
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
                          SizedBox(width:size.width*0.7,child: TextFormField(
                            enabled: _enname,
                            decoration: InputDecoration(
                              hintText: "Họ và tên từ database",
                              floatingLabelBehavior: FloatingLabelBehavior.always,
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
//                              fillColor: Colors.white,
//                              filled: true,
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
//                              border: OutlineInputBorder(
//                                borderSide: BorderSide(
//                                  width: 2.0
//                                )
//                              ),
                            ),
                            validator: (val) => val.length <6 ? "Cần ít nhất 6 kí tự":null,
                            onChanged: (val){
                              setState(() =>name = val);
                            },
                          ),),
                          IconButton(
                              onPressed: (){
                                setState(() {
                                  _enname = !_enname;
                                });
                              },
                              icon: Icon(Icons.edit))
                        ],
                      ),
                      SizedBox(height: size.height*0.015,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.email_rounded),
                          SizedBox(width:size.width*0.7,child: TextFormField(
                            enabled: _enemail,
                            decoration: InputDecoration(
                              hintText: "Email từ database",
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              labelText: "Email",
                              labelStyle: TextStyle(
                                color: Color(0xff1b2536),
                                fontSize: 18,
                              ),
                              hintStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff1b2536),
                              ),
//                              fillColor: Colors.white,
//                              filled: true,
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
//                              border: OutlineInputBorder(
//                                  borderSide: BorderSide(
//                                      width: 2.0
//                                  )
//                              ),
                            ),

                            validator: (val) => val.length <6 ? "Cần ít nhất 6 kí tự":null,
                            onChanged: (val){
                              setState(() =>email = val);
                            },
                          ),),
//                          IconButton(
//                              onPressed: (){
//                                setState(() {
//                                  _enemail = !_enemail;
//                                });
//                              },
//                              icon: Icon(Icons.edit))
                        SizedBox(width: size.width*0.11,)
                        ],
                      ),
                      SizedBox(height: size.height*0.015,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.phone),
                          SizedBox(width:size.width*0.7,child: TextFormField(
                            enabled: _ennumber,
                            decoration: InputDecoration(
                              hintText: "Số điện thoại từ database",
                              floatingLabelBehavior: FloatingLabelBehavior.always,
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
//                              fillColor: Colors.white,
//                              filled: true,
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
//                              border: OutlineInputBorder(
//                                  borderSide: BorderSide(
//                                      width: 2.0
//                                  )
//                              ),
                            ),

                            validator: (val) => val.length <6 ? "Cần ít nhất 6 kí tự":null,
                            onChanged: (val){
                              setState(() =>sodienthoai = val as int);
                            },
                          ),),
                          IconButton(
                              onPressed: (){
                                setState(() {
                                  _ennumber = !_ennumber;
                                });
                              },
                              icon: Icon(Icons.edit))
                        ],
                      ),
                      SizedBox(height: size.height*0.015,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.add_location_sharp),
                          SizedBox(width:size.width*0.7,child: TextFormField(
                            enabled: _enlocation,
                            decoration: InputDecoration(
                              hintText: "Địa chỉ từ database",
                              floatingLabelBehavior: FloatingLabelBehavior.always,
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
//                              fillColor: Colors.white,
//                              filled: true,
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
//                              border: OutlineInputBorder(
//                                  borderSide: BorderSide(
//                                      width: 2.0
//                                  )
//                              ),
                            ),

                            validator: (val) => val.length <6 ? "Cần ít nhất 6 kí tự":null,
                            onChanged: (val){
                              setState(() => diachi = val);
                            },
                          ),),
                          IconButton(
                              onPressed: (){
                                setState(() {
                                  _enlocation = !_enlocation;
                                });
                              },
                              icon: Icon(Icons.edit))
                        ],
                      ),
                      SizedBox(height: size.height*0.015,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.calendar_today_sharp),
                          SizedBox(width:size.width*0.7,child: TextFormField(
                            enabled: _ennamsinh,
                            decoration: InputDecoration(
                              hintText: "Năm sinh từ database",
                              floatingLabelBehavior: FloatingLabelBehavior.always,
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
//                              fillColor: Colors.white,
//                              filled: true,
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
//                              border: OutlineInputBorder(
//                                  borderSide: BorderSide(
//                                      width: 2.0
//                                  )
//                              ),
                            ),

                            validator: (val) => val.length <6 ? "Cần ít nhất 6 kí tự":null,
                            onChanged: (val){
                              setState(() => namsinh = val as int);
                            },
                          ),),
                          IconButton(
                              onPressed: (){
                                setState(() {
                                  _ennamsinh = !_ennamsinh;
                                });
                              },
                              icon: Icon(Icons.edit))
                        ],
                      ),
                      SizedBox(height: size.height*0.015,),
                    ],
                  ),
                ),
              ),
                Center(
                  child: RaisedButton(
                    onPressed: (){},
                    color: Color(0xffc5400c),
                    padding:  EdgeInsets.symmetric(horizontal: 100),
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child:
                    Text("LƯU",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        letterSpacing: 2.2,
                      ),),),
                )

          ]))
        ],
      ),
    );
  }

//  Widget buildTextField( String labelText, String placeholder, bool isPasswordTextField) {
//    return Padding(
//      padding: const EdgeInsets.only(bottom: 35.0,left: 15, top: 7, right: 16),
//      child: TextField(
//        obscureText: isPasswordTextField ? showPassword:false,
//                decoration: InputDecoration(
//                  suffixIcon: isPasswordTextField ? IconButton(
//                    onPressed: (){
//                      showPassword = !showPassword;
//
//                    },
//                    icon: Icon(
//                      Icons.remove_red_eye,
//                      color: Color(0xff1b2536),
//                    ),
//                  ) : null,
//                  contentPadding: EdgeInsets.only(bottom: 3),
//                  labelText: labelText,
//                  floatingLabelBehavior: FloatingLabelBehavior.always,
//                  hintText: placeholder,
//                  hintStyle: TextStyle(
//                    fontSize: 16,
//                    fontWeight: FontWeight.bold,
//                    color: Color(0xff1b2536),
//                  )
//                ),
//              ),
//    );
//  }
}