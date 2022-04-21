import 'package:flutter/material.dart';
import 'package:hiringtest/models/product.dart';
import 'package:hiringtest/utils/locator-utils.dart';
import 'package:hiringtest/utils/utils.dart';

class AddedProductsPage extends StatefulWidget {
  final Object? arguments;

  const AddedProductsPage(this.arguments, {Key? key}) : super(key: key);

  @override
  State<AddedProductsPage> createState() => _AddedProductsPageState();
}

class _AddedProductsPageState extends State<AddedProductsPage> {
  late List<Product> allProducts = [];
  late int _totalCost = 0;
  @override
  void initState() {
    allProducts = widget.arguments as List<Product>;
    allProducts.forEach((element) {
      _totalCost += element.cost!;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart list",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: allProducts.isEmpty
            ? Center(
                child: Text(
                  'Cart is empty',
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flexible(
                    flex: 10,
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
                                  onTap: () {},
                                  isThreeLine: true,
                                  selected: e.isSelected!,
                                  trailing: InkWell(
                                    onTap: () {
                                      setState(() {
                                        e.isSelected = !e.isSelected!;
                                        allProducts = allProducts
                                            .where((element) =>
                                                element.isSelected!)
                                            .toList();
                                        _totalCost = 0;
                                        allProducts.forEach((element) {
                                          _totalCost += element.cost!;
                                        });
                                        if (!e.isSelected!) {
                                          locator.get<Utils>().showAlert(
                                                "${e.productName} removed,\n Total Cost : ₹ $_totalCost ",
                                                backgroundColor: Colors.red,
                                              );
                                        }
                                      });
                                    },
                                    child: Icon(
                                      Icons.remove_circle,
                                    ),
                                  ),
                                  leading: Icon(
                                    Icons.card_giftcard_sharp,
                                  ),
                                  subtitle: Text(
                                    '₹ ${e.cost}',
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
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: 20.0,
                      color: Colors.green,
                      constraints: BoxConstraints.expand(),
                      alignment: Alignment.center,
                      child: Text('Total Cost : ₹ $_totalCost'),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
