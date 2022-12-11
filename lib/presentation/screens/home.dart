import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_scanner/core/colors.dart';
import 'package:stock_scanner/presentation/bloc/stock_bloc.dart';
import 'package:stock_scanner/presentation/screens/market.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
      value: 0,
      lowerBound: 0,
      upperBound: 1,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
    Timer(const Duration(milliseconds: 500), () {
      BlocProvider.of<StockBloc>(context).add(GetStockData());
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
          child: InkWell(
            onTap: () {
              if (_controller.isAnimating) {
                _controller.stop();
                return;
              }
              _controller.repeat();
            },
            child: RotationTransition(
              turns: _animation,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.currency_bitcoin_sharp,
                  color: AppColors.bgColor,
                  size: 18,
                ),
              ),
            ),
          ),
        ),
        title: const Text(
          "Stock Scan Parser",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const MarketScreen(),
    );
  }
}
