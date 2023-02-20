import 'dart:convert';

import 'package:http/http.dart';
import 'package:project/model/GetRouteModel.dart';
import 'package:project/model/GetSchemeIdModel.dart';
import 'package:project/repositary/api/ApiClient.dart';

class IdApi {
  ApiClient apiClient = ApiClient();

  //get route api
  Future<GetRouteModel> getRoute() async {
    print("get route Api working");
    String basePath = "api/get-route";
    // print("***********&&&&&&&&&&&${jsonEncode}");
    Response response =
        await apiClient.invokeApi(path: basePath, method: "GET", body: null);
    print(response.body);
    return GetRouteModel.fromJson(jsonDecode(response.body));
  }

  //get scheme id api
  Future<GetSchemeIdModel> getSchemeId() async {
    print("get scheme id Api working");
    String basePath = "api/get-scheme";
    // print("***********&&&&&&&&&&&${jsonEncode}");
    Response response =
        await apiClient.invokeApi(path: basePath, method: "GET", body: null);
    print(response.body);
    return GetSchemeIdModel.fromJson(jsonDecode(response.body));
  }

  // get place id api
  // Future<GetSchemeIdModel> getSchemeId() async {
  //   print("get scheme id Api working");
  //   String basePath = "api/get-scheme";
  //   // print("***********&&&&&&&&&&&${jsonEncode}");
  //   Response response =
  //       await apiClient.invokeApi(path: basePath, method: "GET", body: null);
  //   print(response.body);
  //   return GetSchemeIdModel.fromJson(jsonDecode(response.body));
  // }
}
