import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotya/src/data/cartData.dart';
import 'package:gotya/src/helpers/colors.dart';
import 'package:gotya/src/models/product.dart';
import 'package:gotya/src/widgets/circleButton.dart';
import 'package:gotya/src/widgets/favoriteButton.dart';
import 'package:gotya/src/widgets/modalCheckbox.dart';
import 'package:gotya/src/widgets/quantityButtons.dart';
import 'package:gotya/src/widgets/scroll.dart';
import 'package:gotya/src/widgets/sliderRange.dart';
import 'package:provider/provider.dart';
import 'package:audioplayers/audio_cache.dart';

class AddProduct extends StatefulWidget {
  AddProduct({this.product, this.icon});

  final Product product;
  final IconData icon;

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  void playSound() {
    final player = AudioCache();
    player.play('sounds/preview.mp3');
  }

  _buildSliderItemsNames() {
    return widget.product.options[0].items
        .map((item) => Text(item.name))
        .toList();
  }

  _buildCheckbox(int startIndex, int endIndex) {
    List<Widget> checkboxList = [];
    for (int i = startIndex; i < endIndex; i++) {
      checkboxList.add(
        ModalCheckBox(
          product: widget.product,
          index: i,
        ),
      );
    }
    return checkboxList;
  }

  buildWheel() {
    List<Widget> items = [];
    for (int i = 0; i <= 200; i++) {
      items.add(
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFBA75),
            border: Border(
              top: BorderSide(
                width: 2,
                color: secondaryColor,
              ),
              bottom: BorderSide(
                width: 2,
                color: secondaryColor,
              ),
            ),
          ),
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartData>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        children: <Widget>[
          Container(
            height: 70.0,
            color: secondaryColor,
            padding: EdgeInsets.only(left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: CircleButton(
                    height: 50.0,
                    width: 50.0,
                    color: Colors.white,
                    buttonChild: Icon(
                      Icons.close,
                      size: 33,
                      color: secondaryColor,
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    CircleButton(
                      height: 50.0,
                      width: 50.0,
                      color: Colors.white,
                      buttonChild: FavoriteButton(
                        product: widget.product,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: ClipOval(
                        child: Material(
                          color: Colors.white,
                          child: InkWell(
                            splashColor: secondaryColor,
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 10.0, left: 4.0),
                                    child: Icon(
                                      Icons.add_shopping_cart,
                                      size: 22.0,
                                      color: secondaryColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 10.0,
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      size: 22.0,
                                      color: secondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              cart.addToCart(widget.product);
                              playSound();
                            },
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (widget.icon == Icons.add_shopping_cart) {
                          cart.addToCart(widget.product);
                        } else {
                          cart.updateProduct(widget.product);
                        }

                        playSound();
                        Navigator.of(context).pop();
                      },
                      child: CircleButton(
                        height: 50.0,
                        width: 50.0,
                        color: Colors.white,
                        buttonChild: Icon(
                          Icons.check,
                          size: 36.0,
                          color: secondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      child: Stack(
                        children: <Widget>[
                          Image.asset(widget.product.image),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              padding: EdgeInsets.all(5.0),
                              width: 200.0,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.5),
                                    Colors.black.withOpacity(0.5),
                                  ],
                                ),
                              ),
                              child: Text(
                                widget.product.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                width: 55.0,
                                height: 45.0,
                                margin: EdgeInsets.only(bottom: 5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(
                                    color: secondaryColor,
                                    width: 3.0,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    widget.product.quantity.toString(),
                                    style: TextStyle(
                                      color: colorDarkGrey,
                                      fontSize: 21.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'Cups',
                                style: TextStyle(
                                  color: secondaryColor,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              ClipPath(
                                child: InkWell(
                                  onTap: () {
                                    Provider.of<CartData>(context)
                                        .incrementQuantity(widget.product);
                                  },
                                  child: Container(
                                    color: secondaryColor,
                                    height: 38.0,
                                    width: 35.0,
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          '+',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                clipper: QuantityUpButton(),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              ClipPath(
                                child: InkWell(
                                  onTap: () {
                                    Provider.of<CartData>(context)
                                        .decrementQuantity(widget.product);
                                  },
                                  splashColor: Colors.red,
                                  child: Container(
                                    color: secondaryColor,
                                    height: 38.0,
                                    width: 35.0,
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 20.0),
                                      child: Center(
                                        child: Text(
                                          '−',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                clipper: QuantityDownButton(),
                              ),
                            ],
                          ),
                          Scroll(
                            value: widget.product.quantity.toDouble(),
                            min: 1.0,
                            max: 100.0,
                            onSlideUpdate: (val) => setState(() {
                              widget.product.quantity = val.toInt();
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SliderRange(product: widget.product),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _buildSliderItemsNames(),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: _buildCheckbox(0, 2),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: _buildCheckbox(
                        2,
                        widget.product.options[1].items.length,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
