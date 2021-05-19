class Location {
  final String id;
  final String title;
  final String detail;
  final String province;
  //final List<String> purposes;
  final String thumbnail;
  //final int numberPeople;

  Location(
    this.id,
    this.title,
    this.detail,
    this.province,
    this.thumbnail,
  );

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(json['id'], json['title'], json['detail'], json['province'],
        json['thumbnail']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'detail': detail,
      'province': province,
      'thumbnail': thumbnail,
      // 'purpose': purposes,
    };
  }
}
