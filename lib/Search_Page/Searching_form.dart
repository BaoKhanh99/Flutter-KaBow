import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kabow/Colors/ProjectColor.dart';
import 'package:kabow/Search_Page/SearchingListPage.dart';

class Searching_form extends StatefulWidget {
  String namePage;
  Searching_form({this.namePage});
  //Searching_form({Key key, @required this.namePage}) : super(key: key);
  @override
  _SearchingState createState() => _SearchingState(namePage: namePage);
}

class Purpose {
  int id;
  String name;

  Purpose(this.id, this.name);
  static List<Purpose> getPurpose() {
    return <Purpose>[
      Purpose(1, "du lich"),
      Purpose(2, "Dạo biển"),
      Purpose(3, "tắm nắng"),
      Purpose(4, "Thư giãn"),
      Purpose(5, "Đi phượt"),
      Purpose(6, "ahihi"),
    ];
  }
}

class _SearchingState extends State<Searching_form> {
  String namePage;
  _SearchingState({@required this.namePage});

  List<Purpose> _purposes = Purpose.getPurpose();
  List<DropdownMenuItem<Purpose>> _dropdownMenuItem;
  Purpose _selectedPurpose;

  final addressTf = TextEditingController();
  final numberPeopleTf = TextEditingController();
  String purposeBtn;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    addressTf.dispose();
    numberPeopleTf.dispose();
    super.dispose();
  }

  @override
  void initState() {
    //myController.text = "aaaaaa";
    _dropdownMenuItem = buildDropdownMenuItem(_purposes);
    //_selectedPurpose = _dropdownMenuItem[0].value;
  }

  List<DropdownMenuItem<Purpose>> buildDropdownMenuItem(List purposes) {
    List<DropdownMenuItem<Purpose>> items = List();
    for (Purpose purpose in purposes) {
      items.add(
        DropdownMenuItem(
          value: purpose,
          child: Text(purpose.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Purpose selectedPurpose) {
    setState(() {
      purposeBtn = selectedPurpose.name;
      _selectedPurpose = selectedPurpose;
      print(purposeBtn);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: PrimaryColor.withOpacity(1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.07, vertical: size.height * 0.015),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: PrimaryColor,
                        )),
                    hintText: "Địa điểm...",
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    hintStyle: TextStyle(color: PrimaryColor.withOpacity(0.6)),
                    filled: true,
                    fillColor: BackgroundColor),
                style: TextStyle(fontSize: 15),
                controller: addressTf,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: 0,
                        top: size.width * 0.03,
                        right: size.width * 0.02,
                        bottom: size.width * 0.03),
                    child: Column(
                      children: [
//                        TextFormField(
//                          decoration: InputDecoration(
//                              border: OutlineInputBorder(
//                                  borderSide:
//                                      BorderSide(color: PrimaryColor),
//                                  borderRadius: BorderRadius.circular(5)),
//                              hintText: "Mục đích",
//                              contentPadding: EdgeInsets.symmetric(
//                                  horizontal: 10, vertical: 8),
//                              hintStyle: TextStyle(
//                                  color: PrimaryColor.withOpacity(0.6),
//                                  fontSize: 14),
//                              filled: true,
//                              fillColor: BackgroundColor),
//                          style: TextStyle(fontSize: 18),
//                        ),
                        Container(
                          width: size.width * 0.48,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: BackgroundColor),
                          child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                            value: _selectedPurpose,
                            items: _dropdownMenuItem,
                            onChanged: onChangeDropdownItem,
                            style: TextStyle(
                              color: PrimaryColor,
                              fontSize: 15,
                            ),
                            hint: Text("Mục đích"),
                            dropdownColor: BackgroundColor,
                          )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width * 0.35,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: PrimaryColor),
                                  borderRadius: BorderRadius.circular(5)),
                              hintText: "Số lượng",
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 0),
                              hintStyle: TextStyle(
                                  color: PrimaryColor.withOpacity(0.6),
                                  fontSize: 15),
                              filled: true,
                              fillColor: BackgroundColor),
                          style: TextStyle(fontSize: 15),
                          controller: numberPeopleTf,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: size.width,
                height: size.height * 0.05,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        backgroundColor: PrimaryColor2,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                    onPressed: () {
                      String checkPurpose = _selectedPurpose?.name ?? null;
                      String checkAddress = addressTf.text ?? null;
                      int checkNumberPeople =
                          int.tryParse(numberPeopleTf.text) ?? null;
                      if (checkAddress.isEmpty ||
                          checkPurpose.isEmpty ||
                          checkNumberPeople == null) {
                        //print("ddrr");
                      } else {
                        if (namePage == "SearchingPage") {
                          //print("$checkAddress");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchingListPage(
                                        address: checkAddress,
                                        purpose: checkPurpose,
                                        numberPeople: checkNumberPeople,
                                      )));
                        } else {
                          print("don't fucking change");
                        }
                      }
                    }
                    //kiem tra ng dung da nhap muc dich chua
                    ,
                    child: Text(
                      "Tìm kiếm",
                      style: TextStyle(color: BackgroundColor),
                    )),
              )
            ],
          ),
        ));
  }
}
