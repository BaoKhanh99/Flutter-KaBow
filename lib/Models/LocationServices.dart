class LocationService {
  final int id;
  final String name;
  final bool washingMachine;
  final Map price;
  final List images;
  final Map address;
  final String provinceId;
  final bool foodService;
  final String category;

  LocationService(
      this.id,
      this.name,
      this.images,
      this.address,
      this.provinceId,
      this.price,
      this.foodService,
      this.washingMachine,
      this.category);

  factory LocationService.fromJson(Map<String, dynamic> json) {
    return LocationService(
        json['id'],
        json['name'],
        json['images'],
        json['address'],
        json['provinceId'],
        json['price'],
        json['foodService'],
        json['washingMachine'],
        json['category']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'images': images,
      'address': address,
      'provinceId': provinceId,
      'price': price,
      'foodService': foodService,
      'washingMachine': washingMachine,
      'category': category,
    };
  }
}
