import 'package:flutter/material.dart';
import 'package:gotya/src/widgets/showMap.dart';
import 'package:gotya/src/widgets/showModal.dart';
import 'package:gotya/src/widgets/checkoutButton.dart';
import 'package:provider/provider.dart';
import '../data/cartData.dart';
import '../helpers/colors.dart';

enum Payment { cash, card }

class CheckoutPage extends StatefulWidget {
  CheckoutPage({this.totalAmount});
  final double totalAmount;

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int _value = 1;
  String currentLocation = "Current Location";

  Payment _payment = Payment.cash;

  bool _checkboxValue = false;

  bool _isActiveNameIcon = false;
  bool _isActiveMobileIcon = false;
  bool _isActiveEmailIcon = false;
  bool _dropdownEnabled = false;

  final _nameFocusNode = FocusNode();
  final _mobileFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  final _mobileController = TextEditingController();

  @override
  void initState() {
    _nameFocusNode.addListener(_showNameIcon);
    _mobileFocusNode.addListener(_showMobileIcon);
    _emailFocusNode.addListener(_showEmailIcon);
    super.initState();
  }

  @override
  void dispose() {
    _nameFocusNode.removeListener(_showNameIcon);
    _mobileFocusNode.removeListener(_showMobileIcon);
    _emailFocusNode.removeListener(_showEmailIcon);

    _nameFocusNode.dispose();
    _mobileFocusNode.dispose();
    _emailFocusNode.dispose();

    _mobileController.dispose();

    super.dispose();
  }

  void _showNameIcon() {
    if (!_nameFocusNode.hasFocus) {
      setState(() {
        _isActiveNameIcon = true;
      });
    }
  }

  void _showMobileIcon() {
    if (!_mobileFocusNode.hasFocus) {
      setState(() {
        _isActiveMobileIcon = true;
      });
    }
  }

  void _showEmailIcon() {
    if (!_emailFocusNode.hasFocus) {
      setState(() {
        _isActiveEmailIcon = true;
      });
    }
  }

  _saveForm(bool value) {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    } else if (!value) {
      return;
    } else {
      _formKey.currentState.save();
      Provider.of<CartData>(context).createOrder();
      Provider.of<CartData>(context).emptyCart();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 10.0),
          child: ListView(
            children: [
              Text(
                'Your contact',
                style: TextStyle(
                  fontSize: 20.0,
                  color: secondaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text('Name:'),
                  SizedBox(
                    width: 23.0,
                  ),
                  Flexible(
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: -20.0),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                      focusNode: _nameFocusNode,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(_mobileFocusNode);
                        if (value.isNotEmpty) {
                          setState(() {
                            _isActiveNameIcon = true;
                          });
                        }
                      },
                      onSaved: (value) {
                        print(value);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a name.';
                        }

                        return null;
                      },
                    ),
                  ),
                  _isActiveNameIcon
                      ? GestureDetector(
                          onTap: () => _nameFocusNode.requestFocus(),
                          child: Icon(
                            Icons.edit,
                            color: secondaryColor,
                          ),
                        )
                      : Container(),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text('Mobile:'),
                  SizedBox(
                    width: 18.0,
                  ),
                  Flexible(
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: -20.0),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      focusNode: _mobileFocusNode,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(_emailFocusNode);
                        if (value.isNotEmpty) {
                          setState(() {
                            _isActiveMobileIcon = true;
                          });
                        }
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a mobile number.';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Please enter a valid number.';
                        }
                        if (int.parse(value) <= 0) {
                          return 'Please enter a number greater than zero.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        print(value);
                      },
                    ),
                  ),
                  _isActiveMobileIcon
                      ? GestureDetector(
                          onTap: () => _mobileFocusNode.requestFocus(),
                          child: Icon(
                            Icons.edit,
                            color: secondaryColor,
                          ),
                        )
                      : Container(),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text('E-mail:'),
                  SizedBox(
                    width: 21.0,
                  ),
                  Flexible(
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: -20.0),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      focusNode: _emailFocusNode,
                      onFieldSubmitted: (value) {
                        if (value.isNotEmpty) {
                          setState(() {
                            _isActiveEmailIcon = true;
                          });
                        }
                      },
                      onSaved: (value) {
                        print(value);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a email.';
                        }
                        if (!value.endsWith('.com')) {
                          return 'Please enter a valid email.';
                        }
                        return null;
                      },
                    ),
                  ),
                  _isActiveEmailIcon
                      ? GestureDetector(
                          onTap: () => _emailFocusNode.requestFocus(),
                          child: Icon(
                            Icons.edit,
                            color: secondaryColor,
                          ),
                        )
                      : Container(),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Deliver',
                style: TextStyle(
                  fontSize: 20.0,
                  color: secondaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Radio(
                        activeColor: Colors.grey[600],
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: Payment.cash,
                        groupValue: _payment,
                        onChanged: (value) {
                          setState(() {
                            _payment = value;
                            _dropdownEnabled = false;
                          });
                        },
                      ),
                      Text('Deliver to my location'),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: DropdownButton(
                      isExpanded: true,
                      value: currentLocation,
                      items: [
                        DropdownMenuItem(
                          child: Text(currentLocation),
                          value: currentLocation,
                        ),
                        DropdownMenuItem(
                          child: Text("Choose on map"),
                          value: "Choose on map",
                        ),
                        DropdownMenuItem(
                          child: Text("Add an address"),
                          value: "Add an address",
                        ),
                      ],
                      onChanged: (value) {
                        switch (value) {
                          case "Current Location":
                            showModal(context, ShowMap(isMarkerActive: false));
                            break;
                          case "Choose on map":
                            showModal(context, ShowMap(isMarkerActive: true));
                            break;
                          default:
                        }
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Radio(
                        activeColor: Colors.grey[600],
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: Payment.cash,
                        groupValue: _payment,
                        onChanged: (value) {
                          setState(() {
                            _payment = value;
                            _dropdownEnabled = false;
                          });
                        },
                      ),
                      Text('I want to pick up'),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: DropdownButton(
                      isExpanded: true,
                      value: currentLocation,
                      items: [
                        DropdownMenuItem(
                          child: Text(currentLocation),
                          value: currentLocation,
                        ),
                        DropdownMenuItem(
                          child: Text("Choose on map"),
                          value: "Choose on map",
                        ),
                        DropdownMenuItem(
                          child: Text("Add an address"),
                          value: "Add an address",
                        ),
                      ],
                      onChanged: (value) {
                        switch (value) {
                          case "Current Location":
                            showModal(context, ShowMap(isMarkerActive: false));
                            break;
                          case "Choose on map":
                            showModal(context, ShowMap(isMarkerActive: true));
                            break;
                          default:
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Payment',
                style: TextStyle(
                  fontSize: 20.0,
                  color: secondaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Radio(
                    activeColor: Colors.grey[600],
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: Payment.cash,
                    groupValue: _payment,
                    onChanged: (value) {
                      setState(() {
                        _payment = value;
                        _dropdownEnabled = false;
                      });
                    },
                  ),
                  Text('Cash on delivery'),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Radio(
                        activeColor: Colors.grey[600],
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: Payment.card,
                        groupValue: _payment,
                        onChanged: (value) {
                          setState(() {
                            _payment = value;
                            _dropdownEnabled = true;
                          });
                        },
                      ),
                      Text('Card on delivery'),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: DropdownButton(
                      isExpanded: true,
                      value: _value,
                      items: [
                        DropdownMenuItem(
                          child: Text("Choose card"),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Mastercard"),
                              Image.asset(
                                "assets/images/mastercard.png",
                                width: 40.0,
                                height: 40.0,
                              ),
                            ],
                          ),
                          value: 2,
                        ),
                        DropdownMenuItem(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Visa"),
                              Image.asset(
                                "assets/images/visa.png",
                                width: 40.0,
                                height: 40.0,
                              ),
                            ],
                          ),
                          value: 3,
                        ),
                        DropdownMenuItem(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("American express"),
                              Image.asset(
                                "assets/images/american.png",
                                width: 35.0,
                                height: 35.0,
                              ),
                            ],
                          ),
                          value: 4,
                        )
                      ],
                      onChanged: _dropdownEnabled
                          ? (value) {
                              setState(() {
                                _value = value;
                              });
                            }
                          : null,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Amount:',
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${widget.totalAmount == 0 ? widget.totalAmount.toStringAsFixed(0) : widget.totalAmount.toStringAsFixed(3)} KD',
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Checkbox(
                    value: _checkboxValue,
                    onChanged: (newValue) {
                      setState(() {
                        _checkboxValue = newValue;
                      });
                    },
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'I have read and accept ',
                      style: TextStyle(
                        color: _checkboxValue ? secondaryColor : colorGrey,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'terms and conditions.',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: _checkboxValue ? secondaryColor : colorGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              CheckoutButton(
                text: 'Confirm and Buy',
                checkboxValue: _checkboxValue,
                onPress: () async {
                  _saveForm(_checkboxValue);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
