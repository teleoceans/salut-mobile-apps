
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
          'Search',
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
            const SizedBox(height: 10,),
            Container(
              height: MediaQuery.of(context).size.height *0.8,
              child: Search.isNotEmpty?buildListView2(false,
                  Search):buildListView2(false,
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
      shrinkWrap: true,
      itemCount: food.length,
      itemBuilder: (context, index) => FoodProductItem2(
        food: food[index],
        isCatering: isCatering,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 10,
        // crossAxisSpacing: 10,
      ),
    );
  }
  Widget buildListView2(bool isCatering, List<FoodProduct> food) {
   return ListView.separated(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (c,i)=>SizedBox(height: 10,),
      itemCount: food.length,
      itemBuilder: (context, index) => FoodProductItem2(
        food: food[index],
        isCatering: isCatering,
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
    // return GestureDetector(
    //   onTap: () => Navigator.pushNamed(
    //     context,
    //     widget.isCatering
    //         ? CateringProductScreen.routeName
    //         : ProductDetailsScreen.routeName,
    //     arguments: widget.food.id,
    //   ),
    //   child: Container(
    //     height: MediaQuery.of(context).size.height *0.1,
    //     color: Colors.blue,
    //     child: Column(
    //       children: [
    //         Container(
    //           height: 120,
    //           width: double.infinity,
    //           margin: EdgeInsets.all(10),
    //           decoration: BoxDecoration(
    //             border: Border.all(),
    //             borderRadius: BorderRadius.circular(15),
    //             image: DecorationImage(
    //               image: AssetImage(
    //                 widget.food.imageUrl,
    //
    //               ),
    //               fit: BoxFit.cover
    //             ),
    //           ),
    //           child: Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.end,
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Material(
    //                   elevation: 2,
    //                   borderRadius: BorderRadius.circular(100),
    //                   child:  CircleAvatar(
    //                     radius: 18,
    //                     backgroundColor: Colors.white,
    //                     child: IconButton(
    //                       onPressed: () {
    //                         Provider.of<ProductsProvider>(context, listen: false)
    //                             .toggleFavStatus(widget.food);
    //                       },
    //                       icon: Icon(
    //                         Provider.of<ProductsProvider>(context, listen: false)
    //                             .findProductById(widget.food.id)
    //                             .isFav
    //                             ? Icons.favorite
    //                             : Icons.favorite_border,
    //                         size: 18,
    //                         color: Provider.of<ProductsProvider>(context,
    //                             listen: false)
    //                             .findProductById(widget.food.id)
    //                             .isFav
    //                             ? Colors.pink
    //                             : Colors.grey,
    //                       ),
    //                     ),
    //                   )
    //                 ),
    //                 Material(
    //                   elevation: 2,
    //                   borderRadius: BorderRadius.circular(100),
    //                   child: CircleAvatar(
    //                     radius: 20,
    //                     backgroundColor: Colors.white,
    //                     child: IconButton(
    //                       onPressed: () {
    //                         // if(Provider.of<AuthProvider>(context, listen: false).authToken.isEmpty || Provider.of<AuthProvider>(context, listen: false).authToken.isEmpty){
    //                         //   Navigator.pushNamed(context, SignInScreen.routeName);
    //                         // }
    //                         // else{
    //                         //   Provider.of<ProductsProvider>(context, listen: false)
    //                         //       .toggleCartStatus(widget.food);
    //                         // }
    //                         Provider.of<ProductsProvider>(context, listen: false)
    //                             .toggleCartStatus(widget.food);
    //                       },
    //                       icon: Icon(
    //                         Icons.add_shopping_cart_rounded,
    //                         color:
    //                         Provider.of<ProductsProvider>(context, listen: false)
    //                             .findProductById(widget.food.id)
    //                             .isAddedtoCart
    //                             ? kPrimaryColor
    //                             : Colors.grey,
    //                       ),
    //                     ),
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ),
    //         ),
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Text(
    //               widget.food.title,
    //               style: const TextStyle(
    //                 color: Colors.black,
    //                 fontWeight: FontWeight.w500,
    //                 fontSize: 18,
    //               ),
    //             ),
    //
    //             widget.food.availableDiscount
    //                 ? RichText(
    //               text: TextSpan(
    //                 style: const TextStyle(
    //                   color: Color.fromARGB(255, 68, 68, 68),
    //                 ),
    //                 children: [
    //                   TextSpan(
    //                       text: '${widget.food.afterDiscount} LE   '),
    //                   TextSpan(
    //                     text: '${widget.food.price} LE',
    //                     style: TextStyle(
    //                       fontSize: 14,
    //                       decoration: TextDecoration.lineThrough,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             )
    //                 : Text(
    //               '${widget.food.price} LE',
    //               style: const TextStyle(
    //                 color: Colors.grey,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    return CartItem(widget.food, widget.isCatering);
  }
  Widget CartItem(FoodProduct food,bool isCatering,) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        // height: 150,
        decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(20),
       ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Image.asset(
                      widget.food.imageUrl,
                      width: MediaQuery.of(context).size.width*0.4,
                      fit: BoxFit.fill,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                      child:CircleAvatar(
                        radius: 13,
                        backgroundColor: Colors.white,
                        child: GestureDetector(
                          child: Icon(
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
                          onTap: () {
                            Provider.of<ProductsProvider>(context, listen: false)
                                .toggleFavStatus(widget.food);
                          },
                        ),
                      )
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                  child:  CircleAvatar(
                    radius: 13,
                    backgroundColor: Colors.white,
                    child:  GestureDetector(
                      child: Center(
                        child: Icon(
                          Icons.add_shopping_cart_rounded,
                          size: 18,
                          color:
                          Provider.of<ProductsProvider>(context, listen: false)
                              .findProductById(widget.food.id)
                              .isAddedtoCart
                              ? kPrimaryColor
                              : Colors.grey,
                        ),
                      ),
                      onTap: () {
                        // if(Provider.of<AuthProvider>(context, listen: false).authToken.isEmpty || Provider.of<AuthProvider>(context, listen: false).authToken.isEmpty){
                        //   Navigator.pushNamed(context, SignInScreen.routeName);
                        // }
                        // else{
                        //   Provider.of<ProductsProvider>(context, listen: false)
                        //       .toggleCartStatus(widget.food);
                        // }
                        Provider.of<ProductsProvider>(context, listen: false)
                            .toggleCartStatus(widget.food);
                        ToastShow(context,"item has been added to cart");
                      },
                    ),
                  ),
                )
              ],
            ),
            // Image.asset(
            //   widget.food.imageUrl,
            //   width: MediaQuery.of(context).size.width*0.4,
            //   fit: BoxFit.fill,
            // ),
            // Container(
            //   height: 120,
            //   width: double.infinity,
            //   margin: EdgeInsets.all(10),
            //   decoration: BoxDecoration(
            //     border: Border.all(),
            //     borderRadius: BorderRadius.circular(15),
            //     image: DecorationImage(
            //         image: AssetImage(
            //           widget.food.imageUrl,
            //
            //         ),
            //         fit: BoxFit.cover
            //     ),
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.end,
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Material(
            //             elevation: 2,
            //             borderRadius: BorderRadius.circular(100),
            //             child:  CircleAvatar(
            //               radius: 18,
            //               backgroundColor: Colors.white,
            //               child: IconButton(
            //                 onPressed: () {
            //                   Provider.of<ProductsProvider>(context, listen: false)
            //                       .toggleFavStatus(widget.food);
            //                 },
            //                 icon: Icon(
            //                   Provider.of<ProductsProvider>(context, listen: false)
            //                       .findProductById(widget.food.id)
            //                       .isFav
            //                       ? Icons.favorite
            //                       : Icons.favorite_border,
            //                   size: 18,
            //                   color: Provider.of<ProductsProvider>(context,
            //                       listen: false)
            //                       .findProductById(widget.food.id)
            //                       .isFav
            //                       ? Colors.pink
            //                       : Colors.grey,
            //                 ),
            //               ),
            //             )
            //         ),
            //         Material(
            //           elevation: 2,
            //           borderRadius: BorderRadius.circular(100),
            //           child: CircleAvatar(
            //             radius: 20,
            //             backgroundColor: Colors.white,
            //             child: IconButton(
            //               onPressed: () {
            //                 // if(Provider.of<AuthProvider>(context, listen: false).authToken.isEmpty || Provider.of<AuthProvider>(context, listen: false).authToken.isEmpty){
            //                 //   Navigator.pushNamed(context, SignInScreen.routeName);
            //                 // }
            //                 // else{
            //                 //   Provider.of<ProductsProvider>(context, listen: false)
            //                 //       .toggleCartStatus(widget.food);
            //                 // }
            //                 Provider.of<ProductsProvider>(context, listen: false)
            //                     .toggleCartStatus(widget.food);
            //               },
            //               icon: Icon(
            //                 Icons.add_shopping_cart_rounded,
            //                 color:
            //                 Provider.of<ProductsProvider>(context, listen: false)
            //                     .findProductById(widget.food.id)
            //                     .isAddedtoCart
            //                     ? kPrimaryColor
            //                     : Colors.grey,
            //               ),
            //             ),
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.food.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10,),
                  widget.food.availableDiscount
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${widget.food.afterDiscount} LE   ',
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Text(
                        '${widget.food.price} LE',
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.black
                        ),
                      ),


                    ],
                  )
                      : Text(
                    '${widget.food.price} LE',
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
