import 'dart:convert';

import 'package:http/http.dart';
import 'package:project/model/CreateCustomerModel.dart';
import 'package:project/repositary/api/ApiClient.dart';

class CreateCollectionApi {
  ApiClient apiClient = ApiClient();

  Future<CreateCustomerModel> getCreateCollection({
    required String customerId,
    required String amount,
    required String routeId,
    required String placeId,
    required String schemeId,
    required String paymentMethod,
  }) async {
    print("Create collection Api working");
    String basePath = "api/create-collection";
    var body = {
      "customer_id": customerId,
      "amount": amount,
      "route_id": routeId,
      "place_id": placeId,
      "scheme_id": schemeId,
      "paymentMethod": paymentMethod
    };
    print("***********&&&&&&&&&&&${jsonEncode(body)}");
    Response response =
        await apiClient.invokeApi(path: basePath, method: "POST", body: body);
    print(response.body);
    return CreateCustomerModel.fromJson(jsonDecode(response.body));
  }
}
