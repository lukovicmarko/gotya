class Company {
  final String name;
  final String description;
  final String image;

  Company({this.name, this.description, this.image});

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "description": description,
      "image": image,
    };
  }
}
