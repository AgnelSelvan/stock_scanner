import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stock_scanner/core/error/failure.dart';
import 'package:stock_scanner/data/datasource/remote_data_source.dart';
import 'package:stock_scanner/data/models/stock_result.dart';
import 'package:stock_scanner/data/repositories/stock_repo_impl.dart';
import 'package:stock_scanner/domain/repository/stock_repository.dart';
import 'package:stock_scanner/domain/usecase/get_stock.dart';

void main() {
  late StockRepository stockRepository;
  late GetStock usecase;

  setUp(() {
    stockRepository =
        StockRepositoryImpl(remoteDataSource: RemoteDataSourceImpl());
    usecase = GetStock(stockRepository);
  });

  StockResult stockResult = StockResult();

  test(
    'should get stok detail from the repository',
    () async {
      // arrange
      when(stockRepository.getStockResult())
          .thenAnswer((_) async => Right(stockResult));

      // act
      final result = await usecase.excute();

      // assert
      expect(result, equals(Right(stockResult)));
    },
  );
}

when(Future<Either<Failure, List<StockResult>>> stockResult) {}
