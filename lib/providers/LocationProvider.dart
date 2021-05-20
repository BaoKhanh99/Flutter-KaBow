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
  String _imageId;
  List _images;
  //int _numberPeople;
  var uuid = Uuid();

  //Getters

  String get title => _title;
  String get detail => _detail;
  String get thumbnail => _thumbnail;
  String get province => _province;
  List get images => _images;
  //int get numberPeople => _numberPeople;
  String get imageId => _imageId;

  Stream<List<Location>> get locations => firestoreService.getLocation();

  //Functions
  loadAll(Location location) {
    if (location != null) {
      _title = location.title;
      _detail = location.detail;
      _province = location.province;
      _thumbnail = location.thumbnail;
      _imageId = location.imageId;
      _images = location.images;
      //_numberPeople = location.numberPeople;
    } else {
      print("opp...");
    }
  }
}
