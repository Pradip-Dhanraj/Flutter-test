import 'package:flutter/material.dart';
import 'package:hiringtest/services/mock-service.dart';
import 'package:hiringtest/utils/locator-utils.dart';
import 'package:hiringtest/utils/navigation-utils.dart';
import 'package:hiringtest/utils/route-utils.dart';
import 'package:hiringtest/utils/utils.dart';
import 'package:hiringtest/views/all-products.dart';

void main() {
  setupLocator();
  locator.get<MockService>().init();
  //print(locator.get<MockService>().allProducts);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hiring Test Demo',
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: generateRoute,
      key: locator<Utils>().scaffoldState,
      initialRoute: allProductsRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: ListPage(),
    );
  }
}
