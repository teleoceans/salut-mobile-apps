import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/constants.dart';
import 'package:salute/data/models/food_product.dart';
import 'package:salute/data/providers/ui_provider.dart';
import 'package:salute/view/screens/shopping_screens/product_screen.dart';

class FoodProductItem extends StatefulWidget {
  const FoodProductItem({super.key, required this.food});
  final FoodProduct food;

  @override
  State<FoodProductItem> createState() => _FoodProductItemState();
}

class _FoodProductItemState extends State<FoodProductItem> {
  bool isAddedToCart = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, ProductDetailsScreen.routeName),
      child: Column(
        children: [
          Container(
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                image: AssetImage(
                  widget.food.imageUrl,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {
                        Provider.of<UiProvider>(context, listen: false)
                            .toggleFavStatus(widget.food);
                      },
                      icon: Icon(
                        Provider.of<UiProvider>(context, listen: false)
                                .findProductById(widget.food.id)
                                .isFav
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Provider.of<UiProvider>(context, listen: false)
                                .findProductById(widget.food.id)
                                .isFav
                            ? Colors.pink
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
                if (widget.food.availableDiscount)
                  Container(
                    width: 80,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomRight: Radius.circular(18)),
                    ),
                    child: const Center(
                      child: Text(
                        "30% off",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  )
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
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
                                style: const TextStyle(
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
              Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(100),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {
                      Provider.of<UiProvider>(context, listen: false)
                          .toggleCartStatus(widget.food);
                    },
                    icon: Icon(
                      Icons.add_shopping_cart_rounded,
                      color: Provider.of<UiProvider>(context, listen: false)
                              .findProductById(widget.food.id)
                              .isAddedtoCart
                          ? kPrimaryColor
                          : Colors.grey,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
