import 'package:gotya/src/models/productOptionItem.dart';

class ProductOption {
  final String name;
  List values;
  List<ProductOptionItem> items;
  bool isRequired;
  bool isMultipleValuesAllowed;

  ProductOption({
    this.name,
    this.values,
    this.items,
    this.isRequired,
    this.isMultipleValuesAllowed,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "values": values,
      "items": items,
      "isRequired": true,
      "isMultipleValuesAllowed": true,
    };
  }
}
