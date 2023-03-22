import 'package:flutter/material.dart';

class ProudctDetailScreen extends StatelessWidget {
  // const ProudctDetailScreen(
  //   this.title, {
  //   super.key,
  // });
  // final String title;
  static const routeName = "/product-detail";

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
    );
  }
}
