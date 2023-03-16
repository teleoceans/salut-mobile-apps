import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/data/providers/auth_provider.dart';
import 'dart:async';
import 'package:salute/data/providers/category_provider.dart';
import 'package:salute/data/providers/products_provider.dart';
import 'package:salute/view/components/default_form_field.dart';
import 'package:salute/view/components/shopping_components/category_list_view.dart';
import 'package:salute/view/components/shopping_components/food_grid_view.dart';
import 'package:salute/view/components/shopping_components/food_promotions.dart';
import 'package:salute/constants.dart';
import 'package:salute/data/models/food_promotion.dart';
import 'package:salute/view/screens/profile_screens/addresses_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../data/helpers/shared_preferences.dart';
import '../../../data/providers/addresses_provider.dart';

class CateringScreen extends StatefulWidget {
  const CateringScreen({
    super.key,
  });
  static const String routeName = "HomeScreen";

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
  State<CateringScreen> createState() => _CateringScreenState();
}

class _CateringScreenState extends State<CateringScreen> {
  Future<void> loadData() async {
    Provider.of<AuthProvider>(context, listen: false).setUserName =
        await SharedPreferencesHelper.getUserName();
    // ignore: use_build_context_synchronously
    Provider.of<AuthProvider>(context, listen: false).setUserName =
        // ignore: use_build_context_synchronously
        Provider.of<AuthProvider>(context, listen: false)
            .userName
            .split(' ')[0];
    // ignore: use_build_context_synchronously
    if (!Provider.of<ProductsProvider>(context, listen: false)
        .isCateringCalled) {
      // ignore: use_build_context_synchronously
      await Provider.of<CategoryProvider>(context, listen: false)
          .getTakeawayCategoriesFromApi()
          .then((_) => Provider.of<ProductsProvider>(context, listen: false)
                  .getCateringProducts()
                  .then(
                (_) {
                  Provider.of<ProductsProvider>(context, listen: false)
                      .setIsCalled = true;
                },
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadData(),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: kCircularLoadingProgress,
                  )
                : ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      Container(
                        margin: const EdgeInsets.all(16),
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(16),
                          child: DefaultFormField(
                            borderRadius: 16,
                            hintText: "${AppLocalizations.of(context)!.search}",
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
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: kPrimaryColor,
                            ),
                              Text(
                              "${AppLocalizations.of(context)!.deliver}",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AddressesScreen.routeName);
                              },
                              child: Text(
                                Provider.of<AddressesProvider>(context)
                                            .currentAddress ==
                                        null
                                    ? "${AppLocalizations.of(context)!.add_addresses}"
                                    : "${Provider.of<AddressesProvider>(context).currentAddress!.buildNumber}, ${Provider.of<AddressesProvider>(context).currentAddress!.streetName}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Image.asset(
                              'assets/images/arrow_down.png',
                              width: 12,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          right: 16.0,
                          bottom: 16,
                        ),
                        child: Text(
                          "${AppLocalizations.of(context)!.welcome} , ${Provider.of<AuthProvider>(context, listen: false).userName}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: 16,
                        ),
                        child: Text(
                          "${AppLocalizations.of(context)!.categories}",
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
                        child: CategoryListView(
                          categories: Provider.of<CategoryProvider>(context)
                              .takeawayCategories,
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
                        child: const FoodPromotionListView(
                            foodPromotions: CateringScreen.promotions),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        height: 210,
                        child: FoodGridView(
                          isCatering: true,
                          food: Provider.of<ProductsProvider>(context)
                              .cateringProduct,
                          
                        ),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        height: 210,
                        child: FoodGridView(
                          isCatering: true,
                          food: Provider.of<ProductsProvider>(context)
                              .cateringProduct,

                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ));
  }
}
