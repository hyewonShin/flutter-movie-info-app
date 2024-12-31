import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class BaseRemoteRepository {
  Dio get client => _client;

  static Dio _client = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      headers: {
        'Authorization': dotenv.get('THEMOVIEDB_TOKEN'),
      },
      // 설정안할 시 실패 응답오면 throw 던져서 에러남
      validateStatus: (status) => true,
    ),
  );
}
