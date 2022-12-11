import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stock_scanner/data/models/stock_result.dart';
import 'package:stock_scanner/domain/usecase/get_stock.dart';

part 'stock_event.dart';
part 'stock_state.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  final GetStock _getStock;
  StockBloc(this._getStock) : super(StockLoading()) {
    on<GetStockData>(
      (event, emit) async {
        final result = await _getStock.excute();
        result.fold(
            (l) => emit(StockError(l.message)), (r) => emit(StockLoaded(r)));
      },
    );
  }
}
