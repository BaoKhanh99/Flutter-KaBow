import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Acount_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        title: Image.asset(
          'assets/logo.png',
          height: 100,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
            left: 16, top: 25, right: 16
        ),
        child: ListView(
          children: [
            Text(
              "PAGE",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 7,
                ),
                Text(
                  "Account",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness:2,
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: (){
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Profile 1"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("OP1"),
                        Text("OP2"),
                        Text("OP3"),
                        Text("OP4"),
                    ],),
                    actions: [
                      FlatButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                      },
                        child: Text("Close"),
                      ),
                    ],
                  );
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Profile",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey[600]),),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.grey[600],),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Change password"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("OP1"),
                            Text("OP2"),
                            Text("OP3"),
                            Text("OP4"),
                          ],),
                        actions: [
                          FlatButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            child: Text("Close"),
                          ),
                        ],
                      );
                    });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Change Password",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey[600]),),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.grey[600],),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Safe and Provicy"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("OP1"),
                            Text("OP2"),
                            Text("OP3"),
                            Text("OP4"),
                          ],),
                        actions: [
                          FlatButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            child: Text("Close"),
                          ),
                        ],
                      );
                    });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Safe and Provicy",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey[600]),),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.grey[600],),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("ABCXYZ"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("OP1"),
                            Text("OP2"),
                            Text("OP3"),
                            Text("OP4"),
                          ],),
                        actions: [
                          FlatButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            child: Text("Close"),
                          ),
                        ],
                      );
                    });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ABCXYZ",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey[600]),),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.grey[600],),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Icon(
                  Icons.widgets,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 7,
                ),
                Text(
                  "Settings",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness:2,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(
                "Dark Mode",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.grey[600]),
              ),
              Transform.scale(
                scale: 0.7,
                  child: CupertinoSwitch(value: true, onChanged: (bool val){})),
            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "ABCXYZ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.grey[600]),
                ),
                Transform.scale(
                    scale: 0.7,
                    child: CupertinoSwitch(value: true, onChanged: (bool val){})),
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "MNLZA",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.grey[600]),
                ),
                Transform.scale(
                    scale: 0.7,
                    child: CupertinoSwitch(value: true, onChanged: (bool val){})),
              ],),
            SizedBox(height: 7,),
            Center(
              child: OutlineButton(
                padding: EdgeInsets.symmetric(horizontal: 40),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                onPressed: (){},
              child: Text(
                  "SIGN OUT",
                style: TextStyle(fontSize: 16,letterSpacing: 2.2,color: Colors.black) ,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}