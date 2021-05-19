import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kabow/Account_Page/Account_Page.dart';
import 'package:kabow/main.dart';

class ProfileEdit_page extends StatelessWidget{
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff1b2536),
          ),
          onPressed:(){
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => MyApp()  ));
          }
          ),
        ),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 25, right: 16),
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              buildTextField("Họ và Tên", "Đặng Phương A", false),
              buildTextField("Email", "dpA.17it3@vku.udn.vn",false),
              buildTextField("Password", "********",true),
              buildTextField("Location", "U Mê Thuộc",false),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: (){},
                  child:
                    Text("HUỶ",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff1b2536),
                      letterSpacing: 2.2,
                    ),),
                  ),
                  RaisedButton(
                      onPressed: (){},
                      color: Color(0xff1b2536),
                      padding: EdgeInsets.symmetric(horizontal: 60),
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child:
                      Text("LƯU",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          letterSpacing: 2.2,
                        ),),)
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField( String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword:false,
                decoration: InputDecoration(
                  suffixIcon: isPasswordTextField ? IconButton(
                    onPressed: (){
                      showPassword = !showPassword;

                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Color(0xff1b2536),
                    ),
                  ) : null,
                  contentPadding: EdgeInsets.only(bottom: 3),
                  labelText: labelText,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: placeholder,
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1b2536),
                  )
                ),
              ),
    );
  }

}