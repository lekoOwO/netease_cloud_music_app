import 'dart:io';

import 'package:dio/dio.dart';
import 'package:netease_cloud_music_app/http/http.dart';

class HttpUtils {
  static late Http _http;

  static Future<void> init(
      {required String baseUrl,
      int? connectTimeout,
      int? receiveTimeout,
      List<Interceptor>? interceptors}) async {
    await Http.init(
        baseUrl: baseUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        interceptors: interceptors);
    _http = Http();
  }

  static void setHeaders(Map<String, dynamic> map) {
    _http.setHeaders(map);
  }

  static Future get(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    bool refresh = false,
  }) async {
    return await _http.get(
      path,
      params: params,
      options: options,
      refresh: refresh,
    );
  }

  static Future post(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
  }) async {
    return await _http.post(
      path,
      data: data,
      params: params,
      options: options,
    );
  }

  static Future put(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
  }) async {
    return await _http.put(
      path,
      data: data,
      params: params,
      options: options,
    );
  }

  static Future delete(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
  }) async {
    return await _http.delete(
      path,
      data: data,
      params: params,
      options: options,
    );
  }

  static Future<bool> checkCookie() async {
    return await Http.checkCookie();
  }

  static Future<void> clearCookie() async {
    await Http.clearCookie();
  }

  static Future<List<Cookie>> loadCookies({Uri? host}) async {
    host ??= Uri.parse(Http.baseUrl);
    return await Http.loadCookies(host: host);
  }
}
