import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:project/repositary/api/ApiException.dart';

class ApiClient {
  static const String basePath = "https://testsys.yes45.in/";
  Future<Response> invokeApi(
      {required String path,
      required String method,
      required Object? body}) async {
    Map<String, String> headerparams = {
      'Cookie':
          'XSRF-TOKEN=eyJpdiI6ImRabmg1UHR0ajJ3anNFeEN0SCtZR1E9PSIsInZhbHVlIjoiNEttckJRcWgwQzMrdXdISnlrQWYvWUloNFNmbEpSa3dESURDajlQZU9WUWNubFZ3QjlJMlNUakdHMXY4Ty9iMjhGQnhubG9DVXorRU5FZHRwb1JQdVV0eWJEUGx3dFFrb2xiT2NsYXVNcG11MnFXcTUxMkNlUTFuWXdaSFFTbmkiLCJtYWMiOiIzMmNiNWNhZTFhNTI2MmJkMTA0NzdhOWEwZWFhN2EwZDUzOGZjNGZiZmNmY2ZiOWZiMDI4MTljMTczN2Y3MmY3IiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IlZRNE9MeG5JalJGbFBvY2V4YW5yOWc9PSIsInZhbHVlIjoiNTJKK3JQUHFmaXJsdGQxTmJKY1BhTWF4NUYvZmFubXlmWHlJbXpXUnJSNDkyQ1YxL283c2tnMnhXSnJQY05hYURUK0pVb25hSWNiUUJUTDl5Y0pLblRJa1dvTmpxckF6M0kxVzVXYldsODVEZWVVaVNsems3UEx5Y0hvQXZiYmciLCJtYWMiOiJjZmRiZjFkMWFiODM3MGMxZjZhODJhYzBjNjQyY2NkNGYyMTI5MzNjOThmYmYzYjJhNWJkODk3NjJlMDVlMWM5IiwidGFnIjoiIn0%3D'
    };
    Response response;

    String url = basePath + path;
    print(url);

    final nullableHeaderParams = (headerparams.isEmpty) ? null : headerparams;

    switch (method) {
      case "POST":
        response = await post(Uri.parse(url), headers: {}, body: body);
        break;
      case "PUT":
        response = await put(Uri.parse(url),
            headers: {
              'content-Type': 'application/json',
            },
            body: body);
        break;
      case "DELETE":
        response = await delete(Uri.parse(url), headers: nullableHeaderParams);
        break;
      case "POST_":
        response = await post(
          Uri.parse(url),
          headers: {},
          body: body,
        );
        break;
      case "GET_":
        response = await post(
          Uri.parse(url),
          headers: {},
          body: body,
        );
        break;
      default:
        response = await get(Uri.parse(url), headers: headerparams);
    }
    print('status of $path =>' + (response.statusCode).toString());
    print(response.body);
    if (response.statusCode >= 400) {
      log(path +
          ' : ' +
          response.statusCode.toString() +
          ' : ' +
          response.body);

      throw ApiException(
          message: _decodeBodyBytes(response), statusCode: response.statusCode);
    }
    return response;
  }

  String _decodeBodyBytes(Response response) {
    var contentType = response.headers["content-type"];
    if (contentType != null && contentType.contains("application/json")) {
      return jsonDecode(response.body)['message'];
    } else {
      return response.body;
    }
  }
}
