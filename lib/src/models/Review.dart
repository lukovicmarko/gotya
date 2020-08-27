class Review {
  final String name;
  final String image;
  final int rating;
  final String comment;
  Review({this.name, this.image, this.rating, this.comment});

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "image": image,
      "rating": rating,
      "comment": comment,
    };
  }
}
