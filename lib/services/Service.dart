import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kabow/Models/Location.dart';
import 'package:kabow/Models/comments.dart';
import 'package:kabow/Models/LocationServices.dart';

class Service {
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
    //print("$province $purpose $people");

    return _db
        .collection('location')
        .doc("$province")
        .collection("$people")
        .where("purpose", arrayContains: "$purpose")
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Location.fromJson(doc.data())).toList());
  }

  Stream<List<Comment>> getComments(
      String provinceId, String people, String locationId) {
    return _db
        .collection('location')
        .doc('$provinceId')
        .collection('$people')
        .doc('$locationId')
        .collection('comments')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Comment.fromJson(doc.data())).toList());
  }

  Stream<List<LocationService>> getLocationService(String provinceId) {
    print(provinceId);
    return _db
        .collection('location')
        .doc("$provinceId")
        .collection("services")
        .limit(5)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => LocationService.fromJson(doc.data()))
            .toList());
  }
}

// CollectionReference col1 = Firestore.instance.collection('service');
// final snapshots = col1.snapshots().map((snapshot) => snapshot.documents.where((doc) => doc["title"] == "Ac replaciment" || doc["title"] == "Oil Service"));
// return (await snapshots.first).toList();
