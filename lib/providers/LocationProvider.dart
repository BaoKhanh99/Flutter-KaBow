import 'package:flutter/material.dart';
import 'package:kabow/Models/Location.dart';
import 'package:kabow/services/LocationService.dart';
import 'package:uuid/uuid.dart';

class LocationProvider with ChangeNotifier {
  final firestoreService = LocationService();
  //DateTime _date;
  String _title;
  String _detail;
  String _thumbnail;
  String _province;
  //sList _purposes;
  int _numberPeople;
  String _locationId;
  var uuid = Uuid();

  //Getters

  String get title => _title;
  String get detail => _detail;
  String get thumbnail => _thumbnail;
  String get province => _province;
  //List get purposes => _purposes;
  int get numberPeople => _numberPeople;

  Stream<List<Location>> get locations => firestoreService.getLocation();

  //Functions
  loadAll(Location location) {
    if (location != null) {
      // _date = DateTime.parse(entry.date);
      // _entry =entry.entry;
      // _entryId = entry.entryId;

      _title = location.title;
      _detail = location.detail;
      _province = location.province;
      _thumbnail = location.thumbnail;
      //_purposes = location.purposes;
      //_numberPeople = location.numberPeople;
    } else {
      print("opp...");
    }
  }
}
