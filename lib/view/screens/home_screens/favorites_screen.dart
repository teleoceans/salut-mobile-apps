import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/view/components/shopping_components/favorites_list_view.dart';

import '../../../data/providers/products_provider.dart';
import '../../components/registration_components/under_picture_body.dart';
import '../../components/shopping_components/food_grid_view.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});
  static const String routeName = "FavoritesScreen";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 16,
        ),
        child: Provider.of<ProductsProvider>(context).favoriteFood.isEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/thank_you.png"),
                  const UnderPictureBody(
                    body:
                        "Seems you haven’t added anything to favorite yet!  Start ordering and click the heart button",
                    title: "Looks like you didn’t add any favorite yet!",
                  ),
                ],
              )
            : ListView(
                children: [
                  FavoritesListView(
                    favoritesFood:
                        Provider.of<ProductsProvider>(context).favoriteFood,
                  ),
                  Container(
                    color: Colors.black87,
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "You may also like",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "See All",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: 420,
                    child: FoodGridView(
                      isCatering: false,
                      food: Provider.of<ProductsProvider>(context)
                          .takeawayProducts,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
