class GetRouteModel {
  GetRouteModel({
    this.data,
    this.success,
    this.messages,
  });

  GetRouteModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    success = json['success'];
    // if (json['messages'] != null) {
    //   messages = [];
    //   json['messages'].forEach((v) {
    //     messages?.add(Dynamic.fromJson(v));
    //   });
    // }
  }
  List<Data>? data;
  bool? success;
  List<dynamic>? messages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['success'] = success;
    if (messages != null) {
      map['messages'] = messages?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  Data({
    this.id,
    this.routeName,
    this.routeDay,
    this.description,
    this.status,
    this.underOfUser,
    this.clusterId,
    this.branchId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    routeName = json['route_name'];
    routeDay = json['route_day'];
    description = json['description'];
    status = json['status'];
    underOfUser = json['under_of_user'];
    clusterId = json['cluster_id'];
    branchId = json['branch_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }
  int? id;
  String? routeName;
  String? routeDay;
  String? description;
  int? status;
  int? underOfUser;
  int? clusterId;
  int? branchId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['route_name'] = routeName;
    map['route_day'] = routeDay;
    map['description'] = description;
    map['status'] = status;
    map['under_of_user'] = underOfUser;
    map['cluster_id'] = clusterId;
    map['branch_id'] = branchId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    return map;
  }
}
