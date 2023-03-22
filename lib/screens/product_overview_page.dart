import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/product_item.dart';
import '../widgets/products_grid.dart';

class ProductOverviewScreen extends StatelessWidget {
  ProductOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Our shop"),
      ),
      body: ProductsGrid(),
    );
  }
}
