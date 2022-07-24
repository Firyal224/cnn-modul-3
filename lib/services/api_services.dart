// ignore_for_file: unused_catch_clause

import 'dart:io';

import 'package:cnn_app/api_url.dart';
import 'package:cnn_app/app_information.dart';
import 'package:cnn_app/session_key.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiServices {
  Future<Response> getData({
    required String url,
    Map<String, dynamic>? parameters,
  }) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String tokenType = preferences.getString(SessionKey.tokenType)!;
    String accessToken = preferences.getString(SessionKey.accessToken)!;
    String tokenTypeWithAccessToken = "$tokenType $accessToken";

    //initializing Dio
    Dio dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio.options.baseUrl = ApiUrl.baseUrl;
    dio.options.connectTimeout = AppInformation.connectTimeout;
    dio.options.receiveTimeout = AppInformation.receiveTimeout;

    //add header dio authorization
    dio.options.headers["Authorization"] = tokenTypeWithAccessToken;
    Response response = await dio.get(
      url,
      queryParameters: parameters == null || parameters.isEmpty ? {} : Map.from(parameters),
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    return response;
  }

  Future<Response> postData({
    required String url,
    required Map<String, dynamic> parameters,
    required bool isJson,
  }) async {
    //initializing Dio
    Dio dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio.options.baseUrl = ApiUrl.baseUrl;
    dio.options.connectTimeout = AppInformation.connectTimeout;
    dio.options.receiveTimeout = AppInformation.receiveTimeout;
    
    try {
        //initializing response
      Response response = await dio.post(
        url,
        data: isJson ? parameters : FormData.fromMap(parameters),
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      return response;
      
    }  on DioError catch (e)  {
      Response? response;
      return response!.data["$e"];
    }
  
  }

  Future<Response> postDataWithToken({
    required String url,
    required Map<String, dynamic> parameters,
    required bool isJson,
  }) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String tokenType = preferences.getString(SessionKey.tokenType)!;
    String accessToken = preferences.getString(SessionKey.accessToken)!;
    String tokenTypeWithAccessToken = "$tokenType $accessToken";

    //initializing Dio
    Dio dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio.options.baseUrl = ApiUrl.baseUrl;
    dio.options.connectTimeout = AppInformation.connectTimeout;
    dio.options.receiveTimeout = AppInformation.receiveTimeout;

    //add header dio authorization
    dio.options.headers["Authorization"] = tokenTypeWithAccessToken;
    dio.options.headers["Content-Type"] = Headers.jsonContentType;
    dio.options.headers["Accept"] = "application/json";

    //initializing response
    Response response = await dio.post(
      url,
      data: isJson ? parameters : FormData.fromMap(parameters),
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    return response;
  }

  Future<Response> putDataWithToken({required String url, required Map<String, dynamic> parameters, required bool isJson, Map<String, dynamic>? queryParameter}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String tokenType = preferences.getString(SessionKey.tokenType)!;
    String accessToken = preferences.getString(SessionKey.accessToken)!;
    String tokenTypeWithAccessToken = "$tokenType $accessToken";

    //initializing Dio
    Dio dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio.options.baseUrl = ApiUrl.baseUrl;
    dio.options.connectTimeout = AppInformation.connectTimeout;
    dio.options.receiveTimeout = AppInformation.receiveTimeout;

    //add header dio authorization
    dio.options.headers["Authorization"] = tokenTypeWithAccessToken;
    dio.options.headers["Content-Type"] = Headers.jsonContentType;
    dio.options.headers["Accept"] = "application/json";

    //initializing response
    Response response = await dio.put(
      url,
      data: isJson ? parameters : FormData.fromMap(parameters),
      queryParameters: queryParameter ?? {},
      options: Options(
        followRedirects: true,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    return response;
  }

  Future getDataV2({
    required String url,
    Map<String, dynamic>? parameters,
  }) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String tokenType = SessionKey.tokenType;
    String accessToken =  preferences.getString("access_token")!;
    String tokenTypeWithAccessToken = "$tokenType $accessToken";

    //initializing Dio
    Dio dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };
    print(tokenTypeWithAccessToken);

    dio.options.baseUrl = ApiUrl.baseUrl;
    dio.options.connectTimeout = AppInformation.connectTimeout;
    dio.options.receiveTimeout = AppInformation.receiveTimeout;
    dio.options.headers["Authorization"] = tokenTypeWithAccessToken;
    try {
      Response response = await dio.get(
        url,
        queryParameters: parameters == null || parameters.isEmpty ? {} : Map.from(parameters),
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      if (response.statusCode == 200) {
        return response;
      } else {
        return "Eror";
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        return {
          "response": "Waktu untuk memuat data sudah habis",
          "message": "connection_timeout",
        };
      } else {
        return {
          "response": "Something went wrong",
          "message": e.error,
        };
      }
    }
  }

  Future postDataV2({
    required String url,
    required Map<String, dynamic> parameters,
    required bool isJson,
  }) async {
    //initializing Dio
    Dio dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio.options.baseUrl = ApiUrl.baseUrl;
    dio.options.connectTimeout = AppInformation.connectTimeout;
    dio.options.receiveTimeout = AppInformation.receiveTimeout;

    //initializing response
    try {
      Response response = await dio.post(
        url,
        data: isJson ? parameters : FormData.fromMap(parameters),
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      if (response.statusCode == 200) {
        return {
          "response": response,
          "message": "success",
        };
      } else {
        return {
          "response": response,
          "message": "failed",
        };
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        return {
          "response": "Waktu untuk memuat data sudah habis",
          "message": "connection_timeout",
        };
      } else {
        if (e.type == DioErrorType.receiveTimeout) {
          return {
            "response": e.error,
            "message": "receive_timeout",
          };
        } else {
          return {
            "response": e.error,
            "message": "unknown",
          };
        }
      }
    }
  }

  Future postDataWithTokenV2({
    required String url,
    required Map<String, dynamic> parameters,
    required bool isJson,
  }) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String tokenType = SessionKey.tokenType;
    String accessToken =  preferences.getString("access_token")!;
    String tokenTypeWithAccessToken = "$tokenType $accessToken";

    
    Dio dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio.options.baseUrl = ApiUrl.baseUrl;
    dio.options.connectTimeout = AppInformation.connectTimeout;
    dio.options.receiveTimeout = AppInformation.receiveTimeout;

    //add header dio authorization
    dio.options.headers["Authorization"] = tokenTypeWithAccessToken;
    dio.options.headers["Content-Type"] = Headers.jsonContentType;
    dio.options.headers["Accept"] = "application/json";

    //initializing response

    try {
      Response response = await dio.post(
        url,
        data: isJson ? parameters : FormData.fromMap(parameters),
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      if (response.statusCode == 200) {
        return {
          "response": response,
          "message": "success",
        };
      } else {
        return {
          "response": response,
          "message": "failed",
        };
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        return {
          "response": "Waktu untuk melakukan request sudah habis",
          "message": "connection_timeout",
        };
      } else {
        if (e.type == DioErrorType.receiveTimeout) {
          return {
            "response": e.error,
            "message": "receive_timeout",
          };
        } else {
          return {
            "response": "Tidak ada koneksi internet",
            "message": "no_internet_connection",
          };
        }
      }
    }
  }

  Future putDataWithTokenV2({required String url, required Map<String, dynamic> parameters, required bool isJson, Map<String, dynamic>? queryParameter}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String tokenType = preferences.getString(SessionKey.tokenType)!;
    String accessToken = preferences.getString(SessionKey.accessToken)!;
    String tokenTypeWithAccessToken = "$tokenType $accessToken";

    //initializing Dio
    Dio dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio.options.baseUrl = ApiUrl.baseUrl;
    dio.options.connectTimeout = AppInformation.connectTimeout;
    dio.options.receiveTimeout = AppInformation.receiveTimeout;

    //add header dio authorization
    dio.options.headers["Authorization"] = tokenTypeWithAccessToken;
    dio.options.headers["Content-Type"] = Headers.jsonContentType;
    dio.options.headers["Accept"] = "application/json";

    //initializing response
    try {
      Response response = await dio.put(
        url,
        data: isJson ? parameters : FormData.fromMap(parameters),
        queryParameters: queryParameter ?? {},
        options: Options(
          followRedirects: true,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );

      if (response.statusCode == 200) {
        return {
          "response": response,
          "message": "success",
        };
      } else {
        return {
          "response": response,
          "message": "failed",
        };
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        return {
          "response": "Waktu untuk melakukan request sudah habis",
          "message": "connection_timeout",
        };
      } else {
        if (e.type == DioErrorType.receiveTimeout) {
          return {
            "response": e.error,
            "message": "receive_timeout",
          };
        } else {
          return {
            "response": "Tidak ada koneksi internet",
            "message": "no_internet_connection",
          };
        }
      }
    }
  }

  Future deleteWithtoken({
    required String url,
  }) async {
     SharedPreferences preferences = await SharedPreferences.getInstance();
    String tokenType = SessionKey.tokenType;
    String accessToken =  preferences.getString("access_token")!;
    String tokenTypeWithAccessToken = "$tokenType $accessToken";

    //initializing Dio
    Dio dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio.options.baseUrl = ApiUrl.baseUrl;
    dio.options.connectTimeout = AppInformation.connectTimeout;
    dio.options.receiveTimeout = AppInformation.receiveTimeout;

    //add header dio authorization
    dio.options.headers["Authorization"] = tokenTypeWithAccessToken;
    dio.options.headers["Content-Type"] = Headers.jsonContentType;
    dio.options.headers["Accept"] = "application/json";

    //initializing response
     try {
       Response response = await dio.delete(
        url,
       );
       print(response);
     } on DioError catch (e) {
      print(e);
     }
  }

}
