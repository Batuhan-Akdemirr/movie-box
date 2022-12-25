import 'package:dio/dio.dart';

class NetworkManager {
  NetworkManager._();

  static NetworkManager instance = NetworkManager._();

  final Dio _dio = Dio();


  Dio get dio => _dio;
}
