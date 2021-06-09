import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kabow/Models/Location.dart';
import 'package:kabow/Models/comments.dart';
import 'package:kabow/Models/LocationServices.dart';
import 'package:kabow/Models/user.dart';

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
  Future updateUserData(
      String name, int yob, String address, int phoneNumber) async {
    return await _db.collection('user').doc(uid).set({
      'name': name,
      'yearOfBirth': yob,
      'address': address,
      'phoneNumber': phoneNumber
    });
  }

  // get User data
  Stream<UserData> getUserData() {
    print("uid: $uid");
    return _db
        .collection('user')
        .doc('$uid')
        .snapshots()
        .map(_userDataFromSnapshot);
  }

  //user data from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    Map data = snapshot.data();
    return UserData(
        uid: uid,
        name: data['name'],
        yob: data['yearOfBirth'],
        phoneNumber: data['phoneNumber'],
        address: data['address']);
  }

  //get favorite list
  Stream<List<Location>> getFavoriteList() {
    return _db
        .collection('user')
        .doc("$uid")
        .collection("favoriteLocation")
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Location.fromJson(doc.data())).toList());
  }

  Future<bool> addServiceForUser(
      int id,
      String name,
      bool washingMachine,
      Map price,
      List images,
      Map address,
      String provinceId,
      bool foodService,
      String category) async {
    return await _db
        .collection('user')
        .doc(uid)
        .collection('favorite')
        .doc()
        .set({
          'id': id,
          'name': name,
          'washMachine': washingMachine,
          'address': address,
          'price': price,
          'images': images,
          'provinceId': provinceId,
          'foodService': foodService,
          'category': category,
        }, SetOptions(merge: true))
        .then((value) => true)
        .catchError((onError) {
          return false;
        });
  }

  Future<bool> checkOrderService(
    int id,
  ) async {
    bool a;
    await _db
        .collection('user')
        .doc(uid)
        .collection('favorite')
        .where('id', isEqualTo: id)
        .get()
        .then((doc) {
      if (doc.docs.isNotEmpty) {
        print("doc from check order: ${doc.docs.length}");
        return a = true;
      } else {
        return a = false;
      }
    });
    print("check order service: $a");
    return a;
  }

  Future deleteOoderedService(
    int id,
  ) async {
    await _db
        .collection('user')
        .doc(uid)
        .collection('favorite')
        .where('id', isEqualTo: id)
        .get()
        .then((doc) {
      doc.docs.forEach((element) {
        _db
            .collection('user')
            .doc(uid)
            .collection('favorite')
            .doc(element.id)
            .delete()
            .then((value) {
          print("cancel success + ${element.id}");
        });
      });
    });
  }
}
