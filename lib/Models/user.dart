class Users {
  final String uid;

  Users({this.uid});
}

class UserData {
  String uid;
  String name;
  int yob;
  String address;
  int phoneNumber;


  UserData({this.uid, this.name, this.yob, this.address, this.phoneNumber});

  @override
  String toString() {
    return 'UserData{uid: $uid, name: $name, yob: $yob, address: $address, phoneNumber: $phoneNumber}';
  }

}
