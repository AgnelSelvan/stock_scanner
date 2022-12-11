import 'package:get_it/get_it.dart';
import 'package:stock_scanner/data/datasource/remote_data_source.dart';
import 'package:stock_scanner/data/repositories/stock_repo_impl.dart';
import 'package:stock_scanner/domain/repository/stock_repository.dart';
import 'package:stock_scanner/domain/usecase/get_stock.dart';
import 'package:stock_scanner/presentation/bloc/stock_bloc.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => StockBloc(locator()));

  // usecase
  locator.registerLazySingleton(() => GetStock(locator()));

  // repository
  locator.registerLazySingleton<StockRepository>(
    () => StockRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  // data source
  locator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(),
  );
}
