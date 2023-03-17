
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/constants.dart';
import 'package:salute/data/models/food_product.dart';
import 'package:salute/data/providers/products_provider.dart';
import 'package:salute/data/providers/shopping_provider.dart';
import 'package:salute/view/components/default_form_field.dart';
import 'package:salute/view/screens/shopping_screens/catering_product_screen.dart';
import 'package:salute/view/screens/shopping_screens/product_screen.dart';

import '../../components/shopping_components/food_grid_view.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key,});
  static const String routeName = "SearchScreen";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<FoodProduct> Search=[];
  bool isSuccess=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Screen',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: kArrowBack(context),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
              child:  TextFormField(
                style: TextStyle(color: Colors.black),
                maxLines:  1,
                keyboardType:TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        16
                    ),
                  ),
                  alignLabelWithHint: true,
                  hintText: "${AppLocalizations.of(context)!.search}",
                  labelStyle: const TextStyle(color: Colors.black),
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  prefixIcon:  const Icon(
                    Icons.search,
                    size: 28,
                    color: kPrimaryColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color:  Colors.transparent,
                      width: 1.0,
                    ),
                  ),
                ),
                onChanged: (v){
                  SearchItem(v.toString());
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: 1,
                color: Colors.black.withOpacity(0.5),
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              height: MediaQuery.of(context).size.height *0.8,
              child: Search.isNotEmpty?buildListView(false,
                  Search):buildListView(false,
                Provider.of<ProductsProvider>(context).takeawayProducts,),
            ),
          ],
        ),
      ),
    );
  }
  void SearchItem(String input){
    setState(() {
      Search=Provider.of<ProductsProvider>(context, listen: false).allProducts.
      where((element) => element.title.toLowerCase().startsWith(input)).toList();
    });
  }
  Widget buildListView(bool isCatering, List<FoodProduct> food) {
   return GridView.builder(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      itemCount: food.length,
      itemBuilder: (context, index) => FoodProductItem2(
        food: food[index],
        isCatering: isCatering,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
    );
  }
}

class FoodProductItem2 extends StatefulWidget {
  const FoodProductItem2({
    super.key,
    required this.food,
    required this.isCatering,
  });
  final bool isCatering;
  final FoodProduct food;

  @override
  State<FoodProductItem2> createState() => _FoodProductItem2State();
}

class _FoodProductItem2State extends State<FoodProductItem2> {
  bool isAddedToCart = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        widget.isCatering
            ? CateringProductScreen.routeName
            : ProductDetailsScreen.routeName,
        arguments: widget.food.id,
      ),
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                image: AssetImage(
                  widget.food.imageUrl,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(100),
                    child:  CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () {
                          Provider.of<ProductsProvider>(context, listen: false)
                              .toggleFavStatus(widget.food);
                        },
                        icon: Icon(
                          Provider.of<ProductsProvider>(context, listen: false)
                              .findProductById(widget.food.id)
                              .isFav
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 18,
                          color: Provider.of<ProductsProvider>(context,
                              listen: false)
                              .findProductById(widget.food.id)
                              .isFav
                              ? Colors.pink
                              : Colors.grey,
                        ),
                      ),
                    )
                  ),
                  Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(100),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () {
                          // if(Provider.of<AuthProvider>(context, listen: false).authToken.isEmpty || Provider.of<AuthProvider>(context, listen: false).authToken.isEmpty){
                          //   Navigator.pushNamed(context, SignInScreen.routeName);
                          // }
                          // else{
                          //   Provider.of<ProductsProvider>(context, listen: false)
                          //       .toggleCartStatus(widget.food);
                          // }
                          Provider.of<ProductsProvider>(context, listen: false)
                              .toggleCartStatus(widget.food);
                        },
                        icon: Icon(
                          Icons.add_shopping_cart_rounded,
                          color:
                          Provider.of<ProductsProvider>(context, listen: false)
                              .findProductById(widget.food.id)
                              .isAddedtoCart
                              ? kPrimaryColor
                              : Colors.grey,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.food.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              widget.food.availableDiscount
                  ? RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Color.fromARGB(255, 68, 68, 68),
                  ),
                  children: [
                    TextSpan(
                        text: '${widget.food.afterDiscount} LE   '),
                    TextSpan(
                      text: '${widget.food.price} LE',
                      style: TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              )
                  : Text(
                '${widget.food.price} LE',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
