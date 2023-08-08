import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/cart.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/widgets/203%20badge.dart';
import 'package:shop_app/widgets/app_drawer.dart';

import '../provider/product.dart';
import '../widgets/products_grid.dart';

enum FilterOptions {
  favourites,
  all,
}

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({super.key});

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  final List<Product> loadedProducts = [];
  var _showFavouriteOnly = false;

  @override
  Widget build(BuildContext context) {
    // final productContainer = Provider.of<Products>(
    //   context,
    //   listen: false,
    // );

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            actions: [
              PopupMenuButton(
                onSelected: (FilterOptions selectedValue) {
                  setState(() {
                    if (selectedValue == FilterOptions.favourites) {
                      _showFavouriteOnly = true;
                    } else {
                      _showFavouriteOnly = false;
                    }
                  });
                },
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                itemBuilder: (_) => [
                  const PopupMenuItem(
                    value: FilterOptions.favourites,
                    child: Text('Only Favourites'),
                  ),
                  const PopupMenuItem(
                    value: FilterOptions.all,
                    child: Text('Show All '),
                  ),
                ],
              ),
              Consumer<Cart>(
                builder: (context, value, ch) => Badge1(
                  value: value.itemCount.toString(),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, CartScreen.routName);
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
            title: const Text(
              'My shop',
              style: TextStyle(color: Colors.white),
            ),
          ),
          drawer: const AppDrawer(),
          body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
            child: ProductsGrid(
              showFavs: _showFavouriteOnly,
            ),
          )),
    );
  }
}
