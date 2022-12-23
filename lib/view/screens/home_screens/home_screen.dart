import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/data/providers/ui_provider.dart';
import 'package:salute/view/components/default_form_field.dart';
import 'package:salute/view/components/shopping_components/category_list_view.dart';
import 'package:salute/view/components/shopping_components/food_grid_view.dart';
import 'package:salute/view/components/shopping_components/food_promotions.dart';
import 'package:salute/constants.dart';
import 'package:salute/data/models/food_promotion.dart';

import '../../../data/models/category.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = "HomeScreen";
  static const List<Category> categories = [
    Category(
      title: 'Pizza',
      imageUrl: 'assets/images/pizza.png',
    ),
    Category(
      title: 'Burger',
      imageUrl: 'assets/images/burger.png',
    ),
    Category(
      title: 'Sandwich',
      imageUrl: 'assets/images/sandwich.png',
    ),
    Category(
      title: 'Pasta',
      imageUrl: 'assets/images/pasta.png',
    ),
  ];
  static const List<FoodPromotion> promotions = [
    FoodPromotion(
      percentage: '15%',
      code: 'MO15OFF',
      onWhichCategory: "All Pasta and Pizza",
      imageUrl: "assets/images/food_promotion.jpg",
    ),
    FoodPromotion(
      percentage: '15%',
      code: 'MO15OFF',
      onWhichCategory: "All Pasta and Pizza",
      imageUrl: "assets/images/food_promotion.jpg",
    ),
    FoodPromotion(
      percentage: '15%',
      code: 'MO15OFF',
      onWhichCategory: "All Pasta and Pizza",
      imageUrl: "assets/images/food_promotion.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(16),
            child: DefaultFormField(
              borderRadius: 16,
              unFocusColor: Colors.transparent,
              focusColor: Colors.black.withOpacity(0.2),
              textColor: Colors.black,
              keyboardType: TextInputType.text,
              prefixIcon: const Icon(
                Icons.search,
                size: 28,
                color: kPrimaryColor,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 16,
          ),
          child: Row(
            children: const [
              Icon(
                Icons.location_on,
                color: kPrimaryColor,
              ),
              Text(
                "  Deliver to ",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Text(
                " 123,ABC, Address address ",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 16,
          ),
          child: Text(
            "Welcome, User",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 16,
          ),
          child: Text(
            "Categories",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 127,
          width: MediaQuery.of(context).size.width,
          child: const CategoryListView(
            categories: categories,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          height: 200,
          child: const FoodPromotionListView(foodPromotions: promotions),
        ),
        const SizedBox(
          height: 28,
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          height: 420,
          child: FoodGridView(food: Provider.of<UiProvider>(context).food),
        ),
      ],
    );
  }
}
