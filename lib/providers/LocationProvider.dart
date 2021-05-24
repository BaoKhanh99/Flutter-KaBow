import 'package:flutter/material.dart';
import 'package:kabow/Models/Location.dart';
import 'package:kabow/services/LocationService.dart';
import 'package:uuid/uuid.dart';

class LocationProvider with ChangeNotifier {
  final firestoreService = LocationService();
  String _title;
  String _purpose;
  String _detail;
  String _province;
  List _images;
  String _people;
  var uuid = Uuid();

  //Getters
  String get title => _title;
  String get detail => _detail;
  String get purpose => _purpose;
  String get province => _province;
  List get images => _images;
  String get people => _people;

  set setProvince(String province) {
    if (province.toLowerCase() == "hà nội") {
      _province = "hanoi";
    } else if (province.toLowerCase() == "hồ chí minh") {
      _province = "hochiminh";
    } else if (province.toLowerCase() == "đà nẵng") {
      _province = "danang";
    }
  }

  set setPeople(int people) {
    if (people <= 3) {
      _people = "few";
    } else if (3 < people && people <= 6) {
      _people = "medium";
    } else if (people > 6) {
      _people = "crowed";
    }
  }

  set setPurpose(String purpose) {
    _purpose = purpose;
  }

  Stream<List<Location>> get locations => firestoreService.getLocation();
  Stream<List<Location>> get searchingQuery =>
      firestoreService.searchingQuery(_province, _purpose, _people);
  //Functions
  loadAll(Location location) {
    if (location != null) {
      _title = location.title;
      _detail = location.detail;
      _province = location.province;
      _images = location.images;
    } else {
      print("opp...");
    }
  }
}
