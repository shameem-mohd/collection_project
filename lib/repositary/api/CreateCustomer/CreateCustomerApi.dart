import 'dart:convert';

import 'package:http/http.dart';
import 'package:project/model/CreateCustomerModel.dart';
import 'package:project/model/GetCustomerModel.dart';
import 'package:project/repositary/api/ApiClient.dart';

class CreateCustomerApi {
  ApiClient apiClient = ApiClient();

  Future<CreateCustomerModel> getCreateCustomer({
    required String name,
    required String mobile,
    required String guardianName,
    required String houseName,
    required String post1,
    required String pin,
    required String landmark,
    required String paymentMethod,
    required String routeId,
    required String schemeId,
    required String placeId,
  }) async {
    print("CreateCustomer Api working");
    String basePath = "api/create-customer";
    var body = {
      // "name": name,
      // "mobile": mobile,
      // "guardianName": guardianName,
      // "house_name": houseName,
      // "post": post,
      // "pin": pin,
      // "landmark": landmark,
      // "paymentMethod": paymentMethod,
      // "route_id": routeId,
      // "scheme_id": schemeId,
      // "place_id": placeId
      'mobile': mobile,
      'name': name,
      'route_id': routeId,
      'scheme_id': schemeId,
      'place_id': placeId,
      'guardian_name': guardianName,
      'house_name': houseName,
      'post': post1,
      'pin': '676503',
      'land_mark': 'near Nayara Pumb',
      'payment_method': 'CASH'
    };
    print(body);
    print("***********&&&&&&&&&&&${jsonEncode(body)}");
    Response response =
        await apiClient.invokeApi(path: basePath, method: "POST", body: body);
    print(response.body);
    return CreateCustomerModel.fromJson(jsonDecode(response.body));
  }

  //get customer api
  Future<GetCustomerModel> getCustomer() async {
    print("get Customer Api working");
    String basePath = "api/get-customer";
    // print("***********&&&&&&&&&&&${jsonEncode}");
    Response response =
        await apiClient.invokeApi(path: basePath, method: "GET", body: null);
    print(response.body);
    return GetCustomerModel.fromJson(jsonDecode(response.body));
  }
}
