import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kabow/Models/Location.dart';

class LocationService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  //Get Entries
  Stream<List<Location>> getLocation() {
    return _db
        .collection('location')
        .doc("recommended")
        .collection("location")
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Location.fromJson(doc.data())).toList());
  }

  Stream<List<Location>> searchingQuery(
      String province, String purpose, String people) {
    print("ddddddd $province");
    // return _db.collection('location').snapshots().map((snapshot) =>
    //     snapshot.docs.where((doc) => doc['province'] == 'Hà Nội').map((doc) {
    //       Location.fromJson(doc.data());
    //     }).toList());
    return _db
        .collection('location')
        .doc("$province")
        .collection("$people")
        .where("purpose", arrayContains: "$purpose")
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Location.fromJson(doc.data())).toList());
  }
}
// CollectionReference col1 = Firestore.instance.collection('service');
// final snapshots = col1.snapshots().map((snapshot) => snapshot.documents.where((doc) => doc["title"] == "Ac replaciment" || doc["title"] == "Oil Service"));
// return (await snapshots.first).toList();
