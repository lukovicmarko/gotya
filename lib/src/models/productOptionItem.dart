class ProductOptionItem {
  final String name;
  final double value;
  double price;
  //added by  me?
  bool isActive;

  ProductOptionItem({
    this.name,
    this.value,
    this.price,
    this.isActive = false,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "value": value,
      "price": price,
      "isActive": isActive,
    };
  }
}
