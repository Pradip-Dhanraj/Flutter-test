import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hiringtest/models/product.dart';
import 'package:hiringtest/services/mock-service.dart';
import 'package:hiringtest/utils/locator-utils.dart';
import 'package:hiringtest/utils/navigation-utils.dart';
import 'package:hiringtest/utils/route-utils.dart';
import 'package:hiringtest/utils/utils.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late int _counter;
  late List<Product> allProducts;

  @override
  void initState() {
    allProducts = locator.get<MockService>().allProducts;
    _counter = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product list",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              var items = allProducts
                  .where((Product element) => element.isSelected!)
                  .toList();
              locator.get<NavigationService>().navigateTo(addedProductsRoute,
                  arguments: items, stateCallBack: () {
                setState(() {
                  _counter = 0;
                  allProducts.forEach((element) {
                    if (element.isSelected!) {
                      _counter++;
                    }
                  });
                });
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                right: 10,
              ),
              child: Row(
                children: [
                  Text(
                    '$_counter',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.shopping_cart,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  child: ListView(
                    children: allProducts
                        .map(
                          (e) => AnimatedContainer(
                            padding: EdgeInsets.all(10),
                            duration: const Duration(
                              milliseconds: 3000,
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: ListTile(
                                dense: true,
                                onTap: () {
                                  setState(() {
                                    e.isSelected = !e.isSelected!;
                                    e.isSelected! ? _counter++ : _counter--;
                                    if (e.isSelected!) {
                                      locator.get<Utils>().showAlert(
                                            "${e.productName} added",
                                            backgroundColor: Colors.green,
                                          );
                                    }
                                  });
                                },
                                isThreeLine: true,
                                selected: e.isSelected!,
                                // iconColor: e.isSelected!
                                //     ? Colors.yellow
                                //     : Colors.green,
                                trailing: Icon(
                                  e.isSelected!
                                      ? Icons.remove_circle
                                      : Icons.add,
                                ),
                                leading: Icon(
                                  e.isSelected!
                                      ? Icons.card_giftcard_sharp
                                      : Icons.hourglass_empty_sharp,
                                ),
                                subtitle: Text(
                                  e.isSelected!
                                      ? 'Added to cart'
                                      : '₹ ${e.cost} - ready to add',
                                ),
                                title: Text(
                                  '${e.productName}',
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
