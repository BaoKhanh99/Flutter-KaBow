import 'package:flutter/material.dart';
import 'package:kabow/Account_Page/authenticate.dart';
import 'package:kabow/Models/Location.dart';
import 'package:kabow/Models/comments.dart';
import 'package:kabow/Models/user.dart';
import 'package:kabow/services/Service.dart';
import 'package:kabow/services/auth.dart';
import 'package:uuid/uuid.dart';

class AuthenticatedProvider with ChangeNotifier {
  final auth = AuthenService();
  // String _title;
  // String _purpose;
  // String _detail;
  // String _province;
  // List _images;
  // String _people;
  // String _provinceId;
  // String _locationId;

  var uuid = Uuid();

  //Getters
  // String get title => _title;
  // String get detail => _detail;
  // String get purpose => _purpose;
  // String get province => _province;
  // List get images => _images;
  // String get people => _people;
  // String get provinceId => _provinceId;
  // String get locationId => _locationId;

  // set setProvince(String province) {
  //   if (province.toLowerCase() == "hà nội") {
  //     _province = "hanoi";
  //   } else if (province.toLowerCase() == "hồ chí minh") {
  //     _province = "hochiminh";
  //   } else if (province.toLowerCase() == "đà nẵng") {
  //     _province = "danang";
  //   }
  // }

  // set setPeople(int people) {
  //   if (people <= 3) {
  //     _people = "few";
  //   } else if (3 < people && people <= 6) {
  //     _people = "medium";
  //   } else if (people > 6) {
  //     _people = "crowed";
  //   }
  // }

  // set setPurpose(String purpose) {
  //   _purpose = purpose;
  // }

  // set setProvinceId(String provinceId) {
  //   _provinceId = provinceId;
  // }

  // set setLocationId(String locationId) {
  //   _locationId = locationId;
  // }

  // set setPeople2(String people) {
  //   _locationId = locationId;
  // }

  Stream<Users> get userInfor => auth.userInfo;
  // Stream<List<Location>> get searchingQuery =>
  //     firestoreService.searchingQuery(_province, _purpose, _people);

  // Stream<List<Comment>> get getComments =>
  //     firestoreService.getComments(_provinceId, _people, _locationId);
  //Functions
  // loadAll(Location location) {
  //   if (location != null) {
  //     _title = location.title;
  //     _detail = location.detail;
  //     _province = location.province;
  //     _images = location.images;
  //   } else {
  //     print("opp...");
  //   }
  // }
}
