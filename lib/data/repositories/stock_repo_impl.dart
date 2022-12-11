import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:stock_scanner/core/error/exception.dart';
import 'package:stock_scanner/core/error/failure.dart';
import 'package:stock_scanner/data/datasource/remote_data_source.dart';
import 'package:stock_scanner/data/models/stock_result.dart';
import 'package:stock_scanner/domain/repository/stock_repository.dart';

class StockRepositoryImpl implements StockRepository {
  final RemoteDataSource remoteDataSource;

  StockRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, List<StockResult>>> getStockResult() async {
    try {
      final result = await remoteDataSource.getStockResult();
      return Right(result);
    } on ServerException {
      return const Left(Failure("Something went wrong!"));
    } on SocketException {
      return const Left(Failure('Failed to connect to the network'));
    }
  }
}
