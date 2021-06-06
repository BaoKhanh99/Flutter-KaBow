import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kabow/Models/Location.dart';
import 'package:kabow/Models/comments.dart';
import 'package:kabow/Models/LocationServices.dart';

class Service {
  final String uid;

  Service({this.uid});

  FirebaseFirestore _db = FirebaseFirestore.instance;

  //Get location
  Stream<List<Location>> getLocation() {
    return _db
        .collection('location')
        .doc("recommended")
        .collection("location")
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Location.fromJson(doc.data())).toList());
  }

  //searching function
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

  //get comments
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

  //get services for location
  Stream<List<LocationService>> getRecommendedService(String provinceId) {
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

  Stream<List<LocationService>> getRecommendedServiceExceptSameDoc(
      String provinceId, int id) {
    return _db
        .collection('location')
        .doc("$provinceId")
        .collection("services")
        .where("id", isNotEqualTo: id)
        .limit(5)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => LocationService.fromJson(doc.data()))
            .toList());
  }

  Stream<List<LocationService>> gethcmServices() {
    return _db
        .collection('location')
        .doc("hochiminh")
        .collection("services")
        .limit(5)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => LocationService.fromJson(doc.data()))
            .toList());
  }

  Stream<List<LocationService>> gethnServices() {
    return _db
        .collection('location')
        .doc("hanoi")
        .collection("services")
        .limit(5)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => LocationService.fromJson(doc.data()))
            .toList());
  }

  Stream<List<LocationService>> getdnServices() {
    return _db
        .collection('location')
        .doc("danang")
        .collection("services")
        .limit(5)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => LocationService.fromJson(doc.data()))
            .toList());
  }

  //update user data
  Future updateUserData(String name, int phoneNumber, String address) async {
    return await _db.collection('user')
        .doc(uid)
        .set({'name': name, 'phoneNumber': phoneNumber, 'address': address});
  }
}

// CollectionReference col1 = Firestore.instance.collection('service');
// final snapshots = col1.snapshots().map((snapshot) => snapshot.documents.where((doc) => doc["title"] == "Ac replaciment" || doc["title"] == "Oil Service"));
// return (await snapshots.first).toList();
