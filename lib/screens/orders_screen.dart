import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';
  const OrdersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your orders'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) => OrderItem(
          order: orderData.orders[i],
        ),
        itemCount: orderData.orders.length,
      ),
      drawer: AppDrawer(),
    );
  }
}
