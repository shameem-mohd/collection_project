class CreateCustomerModel {
  CreateCustomerModel({
    this.success,
    this.massage,
  });

  CreateCustomerModel.fromJson(dynamic json) {
    success = json['success'];
    massage = json['massage'];
  }
  bool? success;
  String? massage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['massage'] = massage;
    return map;
  }
}
