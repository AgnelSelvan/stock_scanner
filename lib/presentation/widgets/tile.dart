import 'package:flutter/material.dart';
import 'package:stock_scanner/core/constants.dart';
import 'package:stock_scanner/core/routes/routes.dart';
import 'package:stock_scanner/data/models/stock_result.dart';

class StockTile extends StatelessWidget {
  final StockResult stockResult;
  const StockTile({
    Key? key,
    required this.stockResult,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, Routes.stockDetails, arguments: {
          "stockResult": stockResult,
        });
      },
      contentPadding: const EdgeInsets.all(10),
      title: Text(
        stockResult.name ?? "",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
      subtitle: Text(
        stockResult.tag ?? "",
        style: TextStyle(
          color: Constants.colorMap[stockResult.color],
          fontSize: 14,
        ),
      ),
    );
  }
}
