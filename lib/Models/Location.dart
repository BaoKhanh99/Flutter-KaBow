class Location {
  final String id;
  final String title;
  final String detail;
  final String province;
  final List images;
  final String thumbnail;
  //final int numberPeople;
  final String imageId;

  Location(this.id, this.title, this.detail, this.province, this.thumbnail,
      this.imageId, this.images);

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(json['id'], json['title'], json['detail'], json['province'],
        json['thumbnail'], json['image_id'], json['images']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'detail': detail,
      'province': province,
      'thumbnail': thumbnail,
      'image_id': imageId,
      'images': images
      //'number_people': numberPeople,
      // 'purpose': purposes,
    };
  }
}
