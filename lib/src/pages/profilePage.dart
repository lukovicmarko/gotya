import 'package:flutter/material.dart';
import 'package:gotya/src/data/productsData.dart';
import 'package:gotya/src/helpers/colors.dart';
import 'package:gotya/src/pages/reviewDetailsPage.dart';
import 'package:gotya/src/provider/bottomNavigationBar.dart';
import 'package:gotya/src/widgets/favoriteButton.dart';
import 'package:gotya/src/widgets/followButton.dart';
import 'package:gotya/src/widgets/followers.dart';
import 'package:gotya/src/widgets/openModalButton.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsData>(context).products;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      padding: EdgeInsets.all(10.0),
      child: ListView(
        children: [
          Container(
            height: 140.0,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [secondaryColor, Colors.white],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    margin: EdgeInsets.all(5.0),
                    width: 120.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset("assets/images/user.png"),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Super Trooper',
                        style: TextStyle(
                          color: secondaryColor,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'stormtrooper@gmail.com',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: secondaryColor,
                        ),
                      ),
                      Text(
                        '+55 12 345678910',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: secondaryColor,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Followers(
                            text: "Followers",
                            numberOfFollowers: "150",
                          ),
                          SizedBox(
                            width: 30.0,
                          ),
                          Followers(
                            text: "Following",
                            numberOfFollowers: "130",
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsetsDirectional.only(top: 10.0),
            child: Row(
              children: [
                FollowButton(
                  text: 'Follow',
                  onPress: () {},
                ),
                SizedBox(
                  width: 3,
                ),
                FollowButton(
                  text: 'Send Message',
                  onPress: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type.",
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: GridView.count(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: (3 / 2.5),
              crossAxisSpacing: 2,
              children: List.generate(products.length, (index) {
                return Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: 135.0,
                          child: Image.asset(
                            products[index].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          left: 0.0,
                          right: 0.0,
                          bottom: 0.0,
                          child: GestureDetector(
                            onTap: () {
                              var provider =
                                  Provider.of<BottomNavigationBarProvider>(
                                      context);
                              provider.currentPage =
                                  ReviewDetailsPage(product: products[index]);
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 5.0),
                              height: 135.0,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.8),
                                  ],
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    FavoriteButton(
                                      product: products[index],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          products[index].name,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                        Container(
                                          width: 40.0,
                                          margin: EdgeInsets.only(right: 5.0),
                                          decoration: BoxDecoration(
                                            color: primaryColor,
                                            borderRadius: BorderRadius.circular(
                                              5.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(right: 2.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Text(
                                                  products[index]
                                                      .rating
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 19.0,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  size: 21.0,
                                                  color: Colors.white,
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 3.0,
                          right: 3.0,
                          child: OpenModalButton(
                            buttonColor: secondaryColor,
                            iconColor: Colors.white,
                            iconSize: 30.0,
                            icon: Icons.add_shopping_cart,
                            product: products[index],
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 5.0, top: 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '${products[index].price.toStringAsFixed(3)} KD  ${products[index].preparationTime}',
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
