import 'package:flutter/material.dart';
import 'package:kabow/Account_Page/login_page.dart';

class register_page extends StatefulWidget{
  @override
  _registerpageState createState() => _registerpageState();
}
class _registerpageState extends State<register_page>{
  final _formKey = GlobalKey<FormState>();
  bool _showpassword = true;
  bool _showrepassword = true;
  String email ="";
  String password ="";
  String repassword ="";
  String  name ="";
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
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
          child: Form(
            key: _formKey,
              child:
              Column(
                children:<Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Nhập họ và tên",
                        labelText: "Họ và tên",
                        labelStyle: TextStyle(fontSize: 18, color: Colors.black)
                    ),
                    validator: (val) => val.isEmpty ?"Nhập họ và tên":null,
                    onChanged: (val){
                      setState(() => name = val);
                    },
                  ),
                  SizedBox(height: size.height*0.02,),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Nhập email",
                      labelText: "Email",
                      labelStyle: TextStyle(fontSize: 18, color: Colors.black)
                  ),
                  validator: (val) => val.isEmpty ?"Enter a email":null,
                  onChanged: (val){
                    setState(() => email = val);
                  },
                ),
                  SizedBox(height: size.height*0.02,),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Nhập mật khẩu",
                        labelText: "Mật Khẩu",
                        labelStyle: TextStyle(fontSize: 18, color: Colors.black),
                      suffixIcon: IconButton(
                          icon: Icon(Icons.remove_red_eye),
                            color: Colors.grey,
                      onPressed: (){
                            setState(() {
                              _showpassword = !_showpassword;
                            });
                      },
                      ),
                      ),
                    obscureText: _showpassword,
                    validator: (val) => val.length <6 ? "Cần ít nhất 6 kí tự":null,
                    onChanged: (val){
                      setState(() =>password = val);
                    },
                    ),
                  SizedBox(height: size.height*0.02,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Nhập lại mật khẩu",
                      labelText: "Nhập lại mật khẩu",
                      labelStyle: TextStyle(fontSize: 18, color: Colors.black),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye),
                        color: Colors.grey,
                        onPressed: (){
                          setState(() {
                            _showrepassword = !_showrepassword;
                          });
                        },
                      ),
                    ),
                    obscureText: _showpassword,
                    onChanged: ( val){
                      setState(() => repassword = val);
                    },
                    validator: (val) => val != password ?"Mật khẩu không trùng khớp":null,
                  ),

                ]
              )),
        ),
          SizedBox(
            height:20,
          ),
          Center(
            child: Container(
                child:RaisedButton(
                  onPressed: () async{
                    if (_formKey.currentState.validate()){
                      print(email);
                      print(password);
                    }
                  },
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
                  onTap: ()  {
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
}