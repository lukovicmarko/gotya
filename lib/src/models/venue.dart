class Venue {
  final String name;
  final String imagePath;
  final double rating;
  final String description;
  Venue({this.name, this.imagePath, this.rating, this.description});

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "rating": rating,
      "imagePath": imagePath,
      "description": description,
    };
  }
}
