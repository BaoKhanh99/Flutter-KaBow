import 'package:flutter/material.dart';
import 'package:kabow/Models/Location.dart';
import 'package:kabow/Models/comments.dart';
import 'package:kabow/services/LocationService.dart';
import 'package:uuid/uuid.dart';

class CommentProvider with ChangeNotifier {
  final firestoreService = LocationService();
  String _people;
  String _provinceId;
  String _locationId;
  var uuid = Uuid();

  //Getters
  String get people => _people;
  String get provinceId => _provinceId;
  String get locationId => _locationId;

  set setPeople(String people) {
    _people = people;
  }

  set setProvinceId(String provinceId) {
    _provinceId = provinceId;
  }

  set setLocationId(String locationId) {
    _locationId = locationId;
  }

  Stream<List<Comment>> get getComments =>
      firestoreService.getComments(_provinceId, _people, _locationId);
  //Functions

}
