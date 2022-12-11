import 'package:flutter/material.dart';
import 'package:stock_scanner/presentation/screens/home.dart';
import 'package:stock_scanner/presentation/screens/stock.dart';

class Routes {
  static const home = "/home";
  static const stockDetails = "/stock/details";
}

class RouterGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: ((context) => const HomeScreen()),
        );
      case Routes.stockDetails:
        final args = settings.arguments as Map<String, dynamic>;
        final stockResult = args["stockResult"];
        return MaterialPageRoute(
          builder: ((context) => StockScreen(
                stockResult: stockResult,
              )),
        );
      default:
        return MaterialPageRoute(
          builder: ((context) => const HomeScreen()),
        );
    }
  }
}
