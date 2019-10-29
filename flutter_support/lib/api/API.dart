import 'package:dio/dio.dart';
import 'package:flutter_support/model/User.dart';

class API {
  /// Create single ton
  static final API singleton = API._internal();

  API._internal();

  static API get instance => singleton;
  final String key = 'DlQREVZMJ3GgdfKpnfOBY5WfVMy7lPxR';

  static final String baseUrl = 'https://jsonplaceholder.typicode.com';

  static final int connectTimeout = 10000;
  static final int receiveTimeout = 5000;

  static final post = 'POST';
  static final get = 'GET';

  static var options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: connectTimeout,
    receiveTimeout: receiveTimeout,
  );
  Dio dio = Dio(options);

  Future<List<Data>> getUsers() async {
    try {
      Response response = await dio.get('/users',
          options: Options(
              method: get,
              responseType: ResponseType.json,
              headers: {"Content-Type": "application/json"}));
      List<Data> dataList = [];
      for (var item in response.data) {
        Data data = Data.fromJson(item);
        dataList.add(data);
      }
      return dataList;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
