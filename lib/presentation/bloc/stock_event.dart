part of 'stock_bloc.dart';

@immutable
abstract class StockEvent {}

class GetStockData extends StockEvent {}
