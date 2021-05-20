
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kabow/Account_Page/Account_Page.dart';
import 'package:kabow/Colors/ProjectColor.dart';
import 'package:kabow/main.dart';

class ProfileEdit_page extends StatelessWidget{
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//        elevation: 1,
//        leading: IconButton(
//          icon: Icon(
//            Icons.arrow_back,
//            color: Color(0xff1b2536),
//          ),
//          onPressed:(){
//            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Acount_Page() ));
//          }
//          ),
//        ),
//      body: Container(
//        padding: EdgeInsets.only(left: 15, top: 25, right: 16),
//        child: GestureDetector(
//          onTap: (){
//            FocusScope.of(context).unfocus();
//          },
//          child: ListView(
//            children: [
//              SizedBox(
//                height: 10,
//              ),
//              Center(
//                child: Stack(
//                  children: [
//                    Container(
//                      width: 130,
//                      height: 130,
//                      decoration:  BoxDecoration(
//                        border: Border.all(
//                          width: 4,
//                          color: Theme.of(context).scaffoldBackgroundColor
//                        ),
//                        boxShadow: [
//                          BoxShadow(
//                            spreadRadius: 2,
//                            blurRadius: 10,
//                            color: Colors.black.withOpacity(0.1),
//                            offset: Offset(0,10),
//                          )
//                        ],
//                        shape: BoxShape.circle,
//                        image:  DecorationImage(
//                          image: AssetImage('assets/Images/meo4.jpg'),
//                          fit: BoxFit.cover,
//                        ),
//                      ),
//                    ),
//                    Positioned(
//                        bottom: 0,
//                        right: 0,
//                        child: Container(
//                      height: 40,
//                      width: 40,
//                      decoration: BoxDecoration(
//                        shape: BoxShape.circle,
//                        border: Border.all(
//                          width: 4,
//                          color: Theme.of(context).scaffoldBackgroundColor
//                        ),
//                        color: Color(0xff1b2536),
//                      ),
//                      child: IconButton(
//                        padding: EdgeInsets.only(left: 1),
//                        onPressed: (){},
//                        icon: Icon(
//                          Icons.edit,
//                          color: Colors.white,
//                        ),
//                        ),
//                    ),
//                    ),
//                  ],
//                ),
//              ),
//              buildTextField("Họ và Tên", "Đặng Phương A", false),
//              buildTextField("Email", "dpA.17it3@vku.udn.vn",false),
//              buildTextField("Password", "*****",true),
//              buildTextField("Location", "U Mê Thuộc",false),
//              SizedBox(
//                height: 25,
//              ),
//              RaisedButton(
//                onPressed: (){},
//                color: Color(0xff1b2536),
//                padding: EdgeInsets.symmetric(horizontal: 60),
//                elevation: 2,
//                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                child:
//                Text("LƯU",
//                  style: TextStyle(
//                    fontSize: 14,
//                    color: Colors.white,
//                    letterSpacing: 2.2,
//                  ),),)
//
//            ],
//          ),
//        ),
//      ),
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
                buildTextField("Họ và Tên", "Đặng Phương A", false),
                buildTextField("Email", "dpA.17it3@vku.udn.vn",false),
                buildTextField("Location", "U Mê Thuộc",false),
                buildTextField("Số điện thoại", "0123456789", false),
                Center(
                  child: RaisedButton(
                    onPressed: (){},
                    color: Color(0xff1b2536),
                    padding:  EdgeInsets.symmetric(horizontal: 80),
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

  Widget buildTextField( String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0,left: 15, top: 7, right: 16),
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