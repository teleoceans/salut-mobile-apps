import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/data/models/food_product.dart';
import 'package:salute/data/models/weight.dart';
import 'package:salute/data/providers/auth_provider.dart';
import 'package:salute/data/providers/current_product_provider.dart';
import 'package:salute/data/providers/products_provider.dart';
import 'package:salute/main.dart';
import 'package:salute/view/components/default_form_field.dart';
import 'package:salute/view/components/shopping_components/weight_quantity_widget.dart';
import 'package:salute/view/screens/registration_screens/sign_in_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../constants.dart';
import '../default_button.dart';
import 'addons_list_view.dart';

class CateringTabView extends StatefulWidget {
  const CateringTabView({
    super.key,
    required this.cateringProduct,
  });
  final FoodProduct cateringProduct;

  @override
  State<CateringTabView> createState() => _CateringTabViewState();
}

class _CateringTabViewState extends State<CateringTabView> {
  FoodProduct? food;
  bool isFirst = true;

  @override
  void initState() {
    widget.cateringProduct.weight = Weight(mass: 1, quantity: 1);
    super.initState();
  }

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
    return ChangeNotifierProvider(
      create: (context) =>PriceModel(),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Image.asset(widget.cateringProduct.imageUrl),
                const  SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.cateringProduct.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        "${widget.cateringProduct.price} LE/KG",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "${AppLocalizations.of(context)!.ingredients}",
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
                    widget.cateringProduct.description,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 0.5,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "${AppLocalizations.of(context)!.weight}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                WeightQuantityWidget(
                  cateringProduct: widget.cateringProduct,
                  mass: 0.25,
                ),
                const SizedBox(
                  height: 12,
                ),
                WeightQuantityWidget(
                  cateringProduct: widget.cateringProduct,
                  mass: 0.5,
                ),
                const SizedBox(
                  height: 12,
                ),
                WeightQuantityWidget(
                  cateringProduct: widget.cateringProduct,
                  mass: 0.75,
                ),
                const SizedBox(
                  height: 12,
                ),
                WeightQuantityWidget(
                  cateringProduct: widget.cateringProduct,
                  mass: 1,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16, top: 16),
                  child: Text(
                    "${AppLocalizations.of(context)!.type}",
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
                    items: widget.cateringProduct.addons ?? [],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16, top: 16),
                  child: Text(
                    "${AppLocalizations.of(context)!.beverages}",
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
                    items: widget.cateringProduct.subProducts ?? [],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16, top: 16),
                  child: Text(
                    "${AppLocalizations.of(context)!.description}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: DefaultFormField(
                    focusColor: Colors.black,
                    hintText: "${AppLocalizations.of(context)!.type_here}",
                    borderRadius: 10,
                    keyboardType: TextInputType.text,
                    maxLines: 5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Consumer<PriceModel>(
              builder:(context ,m,c){
                return DefaultButton(
                  padding: 16,
                  margin: 16,
                  text: "${AppLocalizations.of(context)!.add_cart}",
                  onTap: () {
                    if(Provider.of<AuthProvider>(context, listen: false).authToken.isEmpty || Provider.of<AuthProvider>(context, listen: false).authToken.isEmpty){
                      Navigator.pushNamed(context, SignInScreen.routeName);
                    }
                    else{
                      // Provider.of<ProductsProvider>(context, listen: false)
                      //     .toggleCartStatus(widget.cateringProduct!);
                      if(widget.cateringProduct!.quantity!=0){
                        print(widget.cateringProduct!.discount?.toInt());
                        print(price==0?widget.cateringProduct!.price:price);
                        Provider.of<ProductsProvider>(context, listen: false).allProducts.
                        add(FoodProduct(
                            productType: widget.cateringProduct!.productType,
                            categoryId: widget.cateringProduct!.categoryId,
                            id: widget.cateringProduct!.id,
                            title: widget.cateringProduct!.title,
                            price: price==0?widget.cateringProduct!.price:price,
                            isAddedtoCart: true,
                            discount: widget.cateringProduct!.discount,
                            availableDiscount: widget.cateringProduct!.availableDiscount,
                            imageUrl: widget.cateringProduct!.imageUrl,
                            quantity: widget.cateringProduct!.quantity,
                            isFav: widget.cateringProduct!.isFav,
                            addons: widget.cateringProduct!.addons,
                            afterDiscount: widget.cateringProduct!.afterDiscount,
                            subProducts: widget.cateringProduct!.subProducts,
                            description: widget.cateringProduct!.description)
                        );
                      }
                    }
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
                        "${m.price==0?widget.cateringProduct.price:m.price} LE",
                        //"${m.price} LE",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      //Icon(Icons.add_shopping_cart,color: Colors.white,)
                    ],
                  ),
                );
              }
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
class PriceModel extends ChangeNotifier{
  double price=0;

  changeprice(p){
    price=p;
    notifyListeners();
  }

  IncPrice(p){
    price=price+p;
    notifyListeners();
  }

  DncPrice(p){
    price=price-p;
    notifyListeners();
  }

}
