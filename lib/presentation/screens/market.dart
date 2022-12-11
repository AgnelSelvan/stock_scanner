import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_scanner/presentation/bloc/stock_bloc.dart';
import 'package:stock_scanner/presentation/widgets/seprator.dart';
import 'package:stock_scanner/presentation/widgets/tile.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<StockBloc>(),
      builder: ((context, state) {
        if (state is StockLoaded) {
          return ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return StockTile(
                stockResult: state.stockResult[index],
              );
            },
            itemCount: state.stockResult.length,
            separatorBuilder: (BuildContext context, int index) {
              return const Seprator();
            },
          );
        } else if (state is StockError) {
          return Text(state.message);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
