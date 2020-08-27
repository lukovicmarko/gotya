import 'package:flutter/material.dart';
import 'package:gotya/src/models/product.dart';
import 'package:gotya/src/modules/http.dart';

class CartData extends ChangeNotifier {
  final List<Product> _cart = [];

  int get cartCount {
    return _cart.length;
  }

  get cart => _cart;

  /*pronalazi proizvod u kolekciji proizvoda po atributu ID*/
  getProductByID(productId, products) {
    for (int i = 0; i < products.length; i++) {
      if (products[i].id == productId) {
        return products[i];
      }
    }
  }

  //pronalazi proizvod u kolekciji proizvoda po atributu index
  getProductByIndexInCart(cart, index) {
    for (int i = 0; i < cart.length; i++) {
      if (i == index) {
        return cart[i];
      }
    }
  }

  //ubacivanje proizvoda u korpu
  void addToCart(Product newProduct) {
    final product = Product(
      id: newProduct.id,
      name: newProduct.name,
      price: newProduct.price,
      image: newProduct.image,
      imagePath: newProduct.imagePath,
      quantity: newProduct.quantity,
      deliveryEstimation: newProduct.deliveryEstimation,
      preparationTime: newProduct.preparationTime,
      rating: newProduct.rating,
      description: newProduct.description,
      link: newProduct.link,
      wikipedia: newProduct.wikipedia,
      options: newProduct.options,
      producer: newProduct.producer,
      reviews: newProduct.reviews,
      total: getAmount(newProduct),
      isFavorite: newProduct.isFavorite,
    );

    _cart.add(product);

    //resetProduct(newProduct);
    notifyListeners();
  }

  void resetProduct(Product product) {
    product.quantity = 1;
    product.options[0].items[1].price = 0.5;
    product.options[1].items[0].isActive = false;
    product.options[1].items[1].isActive = false;
    product.options[1].items[2].isActive = false;
    product.options[1].items[3].isActive = false;
    notifyListeners();
  }

  //izbacivanje proizvoda iz korpe
  void removeFromCart(cartProduct) {
    _cart.remove(cartProduct);
    notifyListeners();
  }

  updateProduct(product) {
    getProductByID(product.id, _cart);
    notifyListeners();
  }

  void incrementQuantity(product) {
    product.quantity++;
    getAmount(product);
    notifyListeners();
  }

  void decrementQuantity(product) {
    if (product.quantity != 1) {
      product.quantity--;
      removeAmount(product);
    }
  }

  double getAmount(cartItem) {
    var total = 0.0;
    final sliderPrice = cartItem.options[0].items[1].price;
    final List checkboxItems = cartItem.options[1].items;

    checkboxItems.forEach((item) {
      if (item.isActive) {
        total += item.price;
      }
    });

    cartItem.total = (total + cartItem.price + sliderPrice) * cartItem.quantity;

    return cartItem.total;
  }

  double removeAmount(cartItem) {
    var total = 0.0;
    final sliderPrice = cartItem.options[0].items[1].price;
    final List checkboxItems = cartItem.options[1].items;

    checkboxItems.forEach((item) {
      if (item.isActive) {
        total += item.price;
      }
    });

    cartItem.total -= (total + cartItem.price + sliderPrice);

    notifyListeners();

    return cartItem.total;
  }

  //totalni iznos svih proizvoda
  getTotalAmount() {
    double totalAmount = 0.0;
    _cart.forEach((item) {
      totalAmount += item.total;
    });
    return totalAmount;
  }

  //clear cart
  void emptyCart() {
    _cart.clear();
    notifyListeners();
  }

  Future createOrder() async {
    RequestResult requestResult =
        RequestResult('http://vip_lane.microcommerce.site/order/create');

    var orderResponse = await requestResult.sendData({
      "total": getTotalAmount(),
      "products": _cart,
      "venue": {
        "name": "Maestro caffe",
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed risus leo, tincidunt eget nisl in, pretium mattis turpis. Ut ut mi pellentesque, aliquet ex eget, feugiat augue. Cras scelerisque justo eu mi fringilla malesuada. Nunc vitae scelerisque ligula. Suspendisse tincidunt dui lorem, id venenatis eros pulvinar at. Nunc lorem arcu, vulputate quis varius sit amet, maximus vitae risus. Nulla rhoncus facilisis mauris id aliquam. Cras luctus malesuada ex, sed mollis massa interdum et. Morbi quis mollis libero. Mauris volutpat congue purus ornare auctor.e",
        "image": "1.jpg",
        "rating": 4.8
      },
      "deliveredBy": {
        "name": "Maestro caffe",
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed risus leo, tincidunt eget nisl in, pretium mattis turpis. Ut ut mi pellentesque, aliquet ex eget, feugiat augue. Cras scelerisque justo eu mi fringilla malesuada. Nunc vitae scelerisque ligula. Suspendisse tincidunt dui lorem, id venenatis eros pulvinar at. Nunc lorem arcu, vulputate quis varius sit amet, maximus vitae risus. Nulla rhoncus facilisis mauris id aliquam. Cras luctus malesuada ex, sed mollis massa interdum et. Morbi quis mollis libero. Mauris volutpat congue purus ornare auctor.e",
        "image": "1.jpg",
        "rating": 4.1
      }
    });

    notifyListeners();
    return orderResponse;
  }
}
