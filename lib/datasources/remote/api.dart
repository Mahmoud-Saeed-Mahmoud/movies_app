import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/constants.dart';

class API {
  late final Future<Dio> _dio;

  API(this._dio);

  Future<Response> getResponse(
      {required String path, Map<String, dynamic>? query}) async {
    try {
      return await _dio
          .then((dioInstance) => dioInstance.get(path, queryParameters: query));
    } catch (error) {
      rethrow;
    }
  }
}

final apiProvider = Provider.autoDispose<API>(
  (ref) => API(ref.watch(dioProvider.future)),
);

final dioProvider = FutureProvider.autoDispose<Dio>(
  (ref) async {
    ref.keepAlive();
    final directory = await getApplicationDocumentsDirectory();
    return Dio()
      ..options.baseUrl = baseUrl
      ..options.headers['accept'] = 'application/json'
      ..options.queryParameters['api_key'] = apiKey
      ..interceptors.add(
        DioCacheInterceptor(
          options: CacheOptions(
            store: HiveCacheStore(directory.path),
            hitCacheOnErrorExcept: [],
          ),
        ),
      );
  },
);
