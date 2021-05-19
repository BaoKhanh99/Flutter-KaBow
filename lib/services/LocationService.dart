import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kabow/Models/Location.dart';

class LocationService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  //Get Entries
  Stream<List<Location>> getLocation() {
    return _db.collection('location').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Location.fromJson(doc.data())).toList());
  }
}
