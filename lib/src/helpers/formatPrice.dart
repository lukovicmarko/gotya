class FormatPrice {
  String remainder;
  String price;

  //Spliting remainder from price
  void printPrice(product) {
    String productPrice = product.price.toString();
    int indexOfDecimal = productPrice.indexOf(".");

    price = productPrice.substring(0, indexOfDecimal);
    remainder = productPrice.substring(indexOfDecimal + 1);
  }
}
