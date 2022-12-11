import 'package:dartz/dartz.dart';
import 'package:stock_scanner/core/error/failure.dart';
import 'package:stock_scanner/data/models/stock_result.dart';
import 'package:stock_scanner/domain/repository/stock_repository.dart';

class GetStock {
  final StockRepository stockRepository;

  GetStock(this.stockRepository);

  Future<Either<Failure, List<StockResult>>> excute() {
    return stockRepository.getStockResult();
  }
}
