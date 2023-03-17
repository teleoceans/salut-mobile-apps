import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/data/providers/current_product_provider.dart';
import 'package:salute/data/providers/products_provider.dart';
import 'package:salute/view/components/default_button.dart';
import 'package:salute/view/components/shopping_components/size_choose_widget.dart';
import 'package:salute/view/components/shopping_components/quantity_widget.dart';
import 'package:salute/constants.dart';
import 'package:salute/data/models/food_product.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../components/default_form_field.dart';
import '../../components/shopping_components/addons_list_view.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    super.key,
  });
  static const String routeName = "ProductDetailsScreen";

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  FoodProduct? food;
  bool isFirst = true;
  @override
  Widget build(BuildContext context) {
    if (isFirst) {
      isFirst = false;
      int id = ModalRoute.of(context)!.settings.arguments as int;
      food = Provider.of<ProductsProvider>(context, listen: false)
          .findProductById(id);
      Provider.of<CurrentItemProvider>(context, listen: false)
          .setCurrentFoodProduct = food!;
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Provider.of<CurrentItemProvider>(context, listen: false)
                        .clearCurrentProduct();
                  },
                  child: kArrowBack(context),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(16),
                      child:  SearchFormField(),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(food!.imageUrl),
                    const  SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            food!.title,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            "${food!.price}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    QuantityWidget(
                      object: Provider.of<CurrentItemProvider>(context,
                              listen: false)
                          .food,
                    ),
                      Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                       "${AppLocalizations.of(context)!.description}",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        food!.description,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizeChooseWidget(),
                      Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16, top: 16),
                      child: Text(
                        "${AppLocalizations.of(context)!.addons}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2.3,
                      child: AddonsListView(
                        isAddon: true,
                        items: food!.addons ?? [],
                      ),
                    ),
                      Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16, top: 16),
                      child: Text(
                        "${AppLocalizations.of(context)!.extras}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2.3,
                      child: AddonsListView(
                        isAddon: false,
                        items: food!.subProducts ?? [],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Provider.of<ProductsProvider>(context)
                    .findProductById(food!.id)
                    .isAddedtoCart
                ? DefaultButton(
                    textColor: Colors.white,
                    backgroundColor: Colors.grey,
                    borderColor: Colors.grey,
                    padding: 16,
                    margin: 16,
                    text: "${AppLocalizations.of(context)!.remove}",
                    onTap: () {
                      Provider.of<ProductsProvider>(context, listen: false)
                          .toggleCartStatus(food!);
                    },
                  )
                : DefaultButton(
                    padding: 16,
                    margin: 16,
                    text: "${AppLocalizations.of(context)!.add_cart}",
                    onTap: () {
                      Provider.of<ProductsProvider>(context, listen: false)
                          .toggleCartStatus(food!);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          Text(
                            "${AppLocalizations.of(context)!.add_cart}",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "${Provider.of<CurrentItemProvider>(context).getFinalPrice()}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
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
