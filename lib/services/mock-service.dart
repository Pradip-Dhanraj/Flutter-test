import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:hiringtest/models/product.dart';

class MockService extends ChangeNotifier {
  List<Product> allProducts = [];

  init() {
    try {
      List.generate(
          10,
          (i) => allProducts.add(
                Product(
                  productName: 'Product ${i + 1}',
                  cost: (i * 100) + 100,
                  isSelected: false,
                ),
              ));
      // Random random = new Random();
      // int i = 0;
      // do {
      //   allProducts.add(Product(
      //       productName: 'Product ${i}',
      //       cost: random.nextInt(1000),
      //       isSelected: false));
      // } while (i < 9);
      print(allProducts);
    } catch (e) {
      print(e);
    }
  }
}
