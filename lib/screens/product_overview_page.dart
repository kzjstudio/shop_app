import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/cart_screeen.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import '../providers/cart.dart';
import '../providers/products_provider.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart' as badge;

enum FilterOptions { Favorites, All }

class ProductOverviewScreen extends StatefulWidget {
  ProductOverviewScreen({super.key});

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    final productsContainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Our shop"),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selected) {
              setState(() {
                if (selected == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOptions.Favorites,
                child: Text('Only favorites'),
              ),
              const PopupMenuItem(
                value: FilterOptions.All,
                child: Text('Show all'),
              )
            ],
            icon: const Icon(
              Icons.more_vert,
            ),
          ),
          Consumer<Cart>(
            builder: (_, cartData, ch) => badge.Badge(
                value: cartData.itemCount.toString(),
                color: Colors.green,
                child: ch!),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
                icon: Icon(Icons.shopping_cart)),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(
        showFavorites: _showOnlyFavorites,
      ),
    );
  }
}
