import 'package:flutter/material.dart';
import 'package:kabow/Models/Location.dart';
import 'package:kabow/Models/LocationServices.dart';
import 'package:kabow/services/Service.dart';
import 'package:uuid/uuid.dart';

class ServiceProvider with ChangeNotifier {
  final firestoreService = Service();
  int _id;
  String _name;
  bool _washingMachine;
  Map _price;
  List _images;
  Map _address;
  bool _foodService;
  String _provinceId;
  String _category;

  //Getters
  int get id => _id;
  String get name => _name;
  bool get washingMachine => _washingMachine;
  Map get price => _price;
  List get images => _images;
  Map get address => _address;
  String get provinceId => _provinceId;
  bool get foodService => _foodService;
  String get category => _category;

  set setProvinceId(String provinceId) {
    _provinceId = provinceId;
  }

  set setId(int id) {
    _id = id;
  }

  Stream<List<LocationService>> get getRecommendedService =>
      firestoreService.getRecommendedService(_provinceId);

  Stream<List<LocationService>> get getRecommendedServiceExceptSameDoc =>
      firestoreService.getRecommendedServiceExceptSameDoc(_provinceId, _id);

  Stream<List<LocationService>> get gethcmServices =>
      firestoreService.gethcmServices();

  Stream<List<LocationService>> get gethnServices =>
      firestoreService.gethnServices();

  Stream<List<LocationService>> get getdnServices =>
      firestoreService.getdnServices();

  //Functions

}
