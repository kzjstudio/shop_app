import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:shop_app/screens/product_overview_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ThemeData theme = ThemeData(primarySwatch: Colors.deepPurple);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
      child: MaterialApp(
        title: 'My Shop',
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(secondary: Colors.deepOrange),
          textTheme: GoogleFonts.latoTextTheme(),
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProudctDetailScreen.routeName: (context) => ProudctDetailScreen(),
        },
      ),
    );
  }
}
