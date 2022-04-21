import 'package:flutter/material.dart';
import 'package:hiringtest/views/added-products.dart';
import 'package:hiringtest/views/all-products.dart';

const String allProductsRoute = 'allproducts';
const String addedProductsRoute = 'addedproducts';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case addedProductsRoute:
      return MaterialPageRoute(
        builder: (context) => AddedProductsPage(settings.arguments),
      );
    case allProductsRoute:
      return MaterialPageRoute(builder: (context) => ListPage());
    default:
      return MaterialPageRoute(builder: (context) => ListPage());
  }
}
