import 'package:fapp_setup/injections/injections.dart';
import 'package:fapp_setup/services/dotenv/dotenv_helper.dart';
import 'package:fapp_setup/services/shared_prefer/shared_prefer.dart';
import 'package:fapp_setup/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@immutable
final class DioHelper {
  final String _mainUrl = serviceLocator<DotEnvHelper>().dotEnv.get('MAIN_URL');

  late final Dio _dio;

  Dio get dio => _dio;

  Future<void> init() async {
    _dio = Dio(await _options());
    _dio.interceptors.add(PrettyDioLogger());
  }

  Future<void> updateDioHeaders() async {
    _dio.options.headers = await _headers();
  }

  Future<Map<String, String>> _headers() async {
    return <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization':
          'Bearer ${serviceLocator.get<SharedPreferHelper>().getStringByKey(key: 'token')}'
    };
  }

  Future<BaseOptions> _options() async {
    return BaseOptions(
      baseUrl: _mainUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 10),
      headers: await _headers(),
      queryParameters: {
        "per_page": Constants.perPage,
      },
    );
  }
}
