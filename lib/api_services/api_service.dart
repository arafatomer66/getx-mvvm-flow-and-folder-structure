import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:uniname/utils/key_word.dart';

import '../utils/pref_const.dart';
import 'app_exception.dart';
import 'base_service.dart';

class ApiService extends BaseService {
  late Dio _dio;

  ApiService() {
    BaseOptions options = BaseOptions(
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        // "Authorization": "Bearer $token"
      },
      receiveTimeout: const Duration(seconds: 6),
      connectTimeout: const Duration(seconds: 6),
    );

    try {
      options.headers["Authorization"] = "Bearer ${Pref.getValue(KeyWord.USER_TOKEN)}";
    } catch (e) {
      debugPrint("Authorization header error = $e");
    }

    _dio = Dio(options);
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      compact: true,
    ));
  }

  @override
  Future getGetResponse(String url) async {
    dynamic responseJson;

    Response response;
    try {
      response = await _dio.get(url);
      responseJson = returnResponse(response);
    } on DioError catch (error) {
      responseJson = returnResponse(error.response!);
    } on SocketException {
      return {
        "error": true,
        "message": "No internet connection.",
        "data": [],
      };
    } catch (e) {
      if (e is DioError) {
        print("Response at Repo ${e.response?.data["message"]}");

        return {
          "error": true,
          "message": e.response?.data["message"],
          "data": [],
        };
      }
    }
    return responseJson;
  }

  @override
  Future getPostResponse(String url, data) async {
    dynamic responseJson;
    Response response;
    try {
      response = await _dio.post(
        url,
        data: data,
      );
      //log("Your Response : $response");
      responseJson = returnResponse(response);
      //log("Your Response : $responseJson");
    } on DioError catch (error) {
      responseJson = returnResponse(error.response!);
    } on SocketException {
      return {
        "error": true,
        "message": "No internet connection.",
        "data": [],
      };
    } catch (e) {
      if (e is DioError) {
        print("Response at Repo ${e.response?.data["message"]}");
        return {
          "error": true,
          "message": e.response?.data["message"],
          "data": [],
        };
      }
    }
    return responseJson;
  }

  @visibleForTesting
  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 500:
      default:
        throw FetchDataException('Error occured while communication with server' + ' with status code : ${response.statusCode}');
    }
  }
}
