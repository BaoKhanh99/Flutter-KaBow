class Location {
  final String locationId;
  final String title;
  final String detail;
  final String province;
  final List images;
  final String people;
  final String provinceId;

  Location(this.locationId, this.title, this.detail, this.province, this.images,
      this.provinceId, this.people);

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(json['location_id'], json['title'], json['detail'],
        json['province'], json['images'], json['province_id'], json['people']);
  }

  Map<String, dynamic> toMap() {
    return {
      'location_id': locationId,
      'title': title,
      'detail': detail,
      'province': province,
      'images': images,
      'province_id': provinceId,
      'people': people
    };
  }
}
