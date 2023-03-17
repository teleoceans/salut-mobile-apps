import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:salute/data/providers/auth_provider.dart';
import 'dart:async';
import 'package:salute/data/providers/category_provider.dart';
import 'package:salute/data/providers/products_provider.dart';
import 'package:salute/main.dart';
import 'package:salute/view/components/default_form_field.dart';
import 'package:salute/view/components/shopping_components/category_list_view.dart';
import 'package:salute/view/components/shopping_components/food_grid_view.dart';
import 'package:salute/view/components/shopping_components/food_promotions.dart';
import 'package:salute/constants.dart';
import 'package:salute/data/models/food_promotion.dart';
import 'package:salute/view/screens/profile_screens/addresses_screen.dart';
import '../../../data/helpers/shared_preferences.dart';
import '../../../data/providers/addresses_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
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
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> loadData() async {
    Provider.of<AuthProvider>(context, listen: false).setUserName =
        await SharedPreferencesHelper.getUserName();
    // ignore: use_build_context_synchronously
    Provider.of<AuthProvider>(context, listen: false).setUserName =
        // ignore: use_build_context_synchronously
        Provider.of<AuthProvider>(context, listen: false)
            .userName
            .split(' ')[0];
    Provider.of<AuthProvider>(context, listen: false).setAuthToken =
    await SharedPreferencesHelper.getSavedUser();
    // ignore: use_build_context_synchronously
    Provider.of<AuthProvider>(context, listen: false).setAuthToken =
    // ignore: use_build_context_synchronously
    Provider.of<AuthProvider>(context, listen: false)
        .authToken;

    // ignore: use_build_context_synchronously
    if (!Provider.of<ProductsProvider>(context, listen: false).isCalled) {
      // ignore: use_build_context_synchronously
      await Provider.of<CategoryProvider>(context, listen: false)
          .getTakeawayCategoriesFromApi()
          .then((_) => Provider.of<ProductsProvider>(context, listen: false)
                  .getTakeawayProductsFromApi()
                  .then(
                (_) {
                  Provider.of<ProductsProvider>(context, listen: false)
                      .setIsCalled = true;
                },
              ))
          .then((value) async {
        if (!Provider.of<AddressesProvider>(context, listen: false).isCalled) {
          //Token=SharedPreferencesHelper.data['access_token'];

          await Provider.of<AddressesProvider>(context, listen: false)
              .fetchAddress(
                  Provider.of<AuthProvider>(context, listen: false).authToken)
              .then((value) {
            Provider.of<AddressesProvider>(context, listen: false).setIsCalled =
                true;
          });
          print("authToken");
          print(Provider.of<AuthProvider>(context, listen: false).authToken);
        }
      });
    }
  }
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();

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
                        child:  SearchFormField(),
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
                          foodPromotions: HomeScreen.promotions),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      height: 210,
                      child: FoodGridView(
                        isCatering: false,
                        food: Provider.of<ProductsProvider>(context)
                            .takeawayProducts,
                      ),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      height: 210,
                      child: FoodGridView(
                        isCatering: true,
                        food: Provider.of<ProductsProvider>(context)
                            .takeawayProducts,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
    );
  }
}
