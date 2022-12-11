import 'dart:convert';

import 'package:http/http.dart';
import 'package:stock_scanner/core/api_url.dart';
import 'package:stock_scanner/core/error/exception.dart';
import 'package:stock_scanner/data/models/stock_result.dart';

abstract class RemoteDataSource {
  Future<List<StockResult>> getStockResult();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<List<StockResult>> getStockResult() async {
    final response = await get(Uri.parse(APIUrl.baseUrl + APIUrl.getStock));
    if (response.statusCode == 200) {
      final resJson = jsonDecode(utf8.decode(response.bodyBytes));
      if (resJson is List) {
        List<StockResult> allData = [];
        for (var res in resJson) {
          allData.add(StockResult.fromJson(res));
        }
        return allData;
      } else {
        return [];
      }
    } else {
      throw ServerException();
    }
  }
}
