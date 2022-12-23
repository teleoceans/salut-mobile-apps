import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/view/components/default_button.dart';
import 'package:salute/constants.dart';

import '../../../data/models/food_product.dart';
import '../../../data/providers/ui_provider.dart';

class ListViewItem extends StatefulWidget {
  const ListViewItem({super.key, required this.product, required this.forFav});
  final FoodProduct product;
  final bool forFav;
  @override
  State<ListViewItem> createState() => _ListViewItemState();
}

class _ListViewItemState extends State<ListViewItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 140,
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  widget.product.imageUrl,
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
                            .toggleFavStatus(widget.product);
                      },
                      icon: Icon(
                        Provider.of<UiProvider>(context, listen: false)
                                .findProductById(widget.product.id)
                                .isFav
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Provider.of<UiProvider>(context, listen: false)
                                .findProductById(widget.product.id)
                                .isFav
                            ? Colors.pink
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
                if (widget.product.availableDiscount)
                  Container(
                    width: 80,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
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
            width: 18,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.product.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                widget.product.price.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              widget.forFav
                  ? widget.product.isAddedtoCart
                      ? DefaultButton(
                          text: "Remove",
                          onTap: () {
                            Provider.of<UiProvider>(context, listen: false)
                                .toggleCartStatus(widget.product);
                          },
                          width: 160,
                          height: 40,
                          textSize: 17,
                          backgroundColor: Colors.grey,
                          borderColor: Colors.grey,
                        )
                      : DefaultButton(
                          text: "Add To Cart",
                          onTap: () {
                            Provider.of<UiProvider>(context, listen: false)
                                .toggleCartStatus(widget.product);
                          },
                          width: 160,
                          height: 40,
                          textSize: 17,
                        )
                  : Row(
                      children: [
                        Container(
                          width: 40,
                          height: 50,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextButton(
                            child: const Text(
                              "-",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            onPressed: () {
                              if (widget.product.quantity > 1) {
                                setState(() {
                                  widget.product.quantity--;
                                });
                              } else {
                                Provider.of<UiProvider>(context, listen: false)
                                    .toggleCartStatus(widget.product);
                              }
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              widget.product.quantity.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 50,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextButton(
                            child: const Text(
                              "+",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                widget.product.quantity++;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
            ],
          )
        ],
      ),
    );
  }
}
