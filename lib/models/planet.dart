class Planet {
  int id;
  String? name;
  String? information;
  String? environmentInfo;
  double? mass;
  double? gravity;
  double? hours;
  double? velocity;
  String? imagePath;
  int? temp;
  double? distance;
  bool isFavourite;

  Planet({
    required this.id,
    this.name,
    this.information,
    this.environmentInfo,
    this.mass,
    this.gravity,
    this.hours,
    this.velocity,
    this.imagePath,
    this.temp,
    this.distance,
    required this.isFavourite,
  });
}
