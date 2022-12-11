part of 'stock_bloc.dart';

@immutable
abstract class StockState {}

class StockLoading extends StockState {}

class StockLoaded extends StockState {
  final List<StockResult> stockResult;

  StockLoaded(this.stockResult);
}

class StockError extends StockState {
  final String message;

  StockError(this.message);
}
