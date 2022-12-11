import 'package:flutter/material.dart';
import 'package:stock_scanner/core/constants.dart';
import 'package:stock_scanner/data/models/stock_result.dart';

class StockScreen extends StatelessWidget {
  final StockResult stockResult;
  const StockScreen({Key? key, required this.stockResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.blue.withOpacity(0.4),
                  height: 120,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        stockResult.name ?? "-",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        stockResult.tag ?? "",
                        style: TextStyle(
                          color: Constants.colorMap[stockResult.color],
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ),
                ...(stockResult.criteria ?? [])
                    .map((e) => ListTile(
                          title: RichText(
                              text: TextSpan(
                                  children: (e.allText ?? [])
                                      .map((f) => TextSpan(
                                          text: f.text,
                                          style: TextStyle(
                                            color: f.color,
                                          )))
                                      .toList())),
                          subtitle: Text(
                              (stockResult.criteria ?? []).indexOf(e) <
                                      ((stockResult.criteria ?? []).length - 1)
                                  ? "and"
                                  : ""),
                        ))
                    .toList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
