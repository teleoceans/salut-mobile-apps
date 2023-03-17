import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/view/components/shopping_components/favorites_list_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
                  UnderPictureBody(
                    body: "${AppLocalizations.of(context)!.favorite_not1}",
                    title: "${AppLocalizations.of(context)!.favorite_not2}",
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
                        Text(
                        "${AppLocalizations.of(context)!.more_pro}",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "${AppLocalizations.of(context)!.search}",//See All
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
                    height: 210,
                    child: FoodGridView(
                      isCatering: false,
                      food: Provider.of<ProductsProvider>(context)
                          .takeawayProducts,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
      ),
    );
  }
}
