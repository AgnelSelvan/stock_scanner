import 'package:dartz/dartz.dart';
import 'package:stock_scanner/core/error/failure.dart';
import 'package:stock_scanner/data/models/stock_result.dart';

abstract class StockRepository {
  Future<Either<Failure, List<StockResult>>> getStockResult();
}
