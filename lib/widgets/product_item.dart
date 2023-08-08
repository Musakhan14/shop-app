import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/cart.dart';
import 'package:shop_app/screens/product_detail_screen.dart';

import '../provider/product.dart';

class ProductItem extends StatelessWidget {
  // final String id, title, imageUrl;
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //all data due to listen false user cant interact with below widget like tap on favourite
    // doesnt work
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            onPressed: () {
              cart.addItem(
                productId: product.id,
                price: product.price,
                title: product.title,
              );
            },
            icon: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).canvasColor,
            ),
          ),
          // Due to consumer now user can interact with favourit button thay can tap on button
          //Consumer listen to changes
          leading: Consumer<Product>(
            builder: (context, value, child) => IconButton(
                onPressed: () {
                  product.toggleFavouriteStatus();
                },
                icon: Icon(
                  value.isFavourit ? Icons.favorite : Icons.favorite_outline,
                  color: Colors.deepOrange,
                )),
          ),
        ),
        child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                ProductDetailScreemn.routName,
                arguments: product.id,
              );
            },
            child: Image.network(product.imageUrl)),
      ),
    );
  }
}
