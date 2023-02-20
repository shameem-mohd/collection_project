class GetSchemeIdModel {
  GetSchemeIdModel({
    this.data,
    this.success,
    this.messages,
  });

  GetSchemeIdModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(SchemeData.fromJson(v));
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
  List<SchemeData>? data;
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

class SchemeData {
  SchemeData({
    this.id,
    this.code,
    this.name,
    this.subName,
    this.description,
    this.startDate,
    this.schemeDuration,
    this.durationType,
    this.endDate,
    this.luckyDrawDate,
    this.joiningDate,
    this.joiningStatus,
    this.schemeClose,
    this.schemeAmount,
    this.totalAmount,
    this.underOfUser,
    this.status,
    this.clusterId,
    this.branchId,
    this.schemeMembers,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  SchemeData.fromJson(dynamic json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    subName = json['sub_name'];
    description = json['description'];
    startDate = json['start_date'];
    schemeDuration = json['scheme_duration'];
    durationType = json['duration_type'];
    endDate = json['end_date'];
    luckyDrawDate = json['lucky_draw_date'];
    joiningDate = json['joining_date'];
    joiningStatus = json['joining_status'];
    schemeClose = json['scheme_close'];
    schemeAmount = json['scheme_amount'];
    totalAmount = json['total_amount'];
    underOfUser = json['under_of_user'];
    status = json['status'];
    clusterId = json['cluster_id'];
    branchId = json['branch_id'];
    schemeMembers = json['scheme_members'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }
  int? id;
  String? code;
  String? name;
  String? subName;
  dynamic description;
  String? startDate;
  int? schemeDuration;
  String? durationType;
  String? endDate;
  String? luckyDrawDate;
  String? joiningDate;
  int? joiningStatus;
  String? schemeClose;
  int? schemeAmount;
  int? totalAmount;
  int? underOfUser;
  int? status;
  int? clusterId;
  int? branchId;
  String? schemeMembers;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['code'] = code;
    map['name'] = name;
    map['sub_name'] = subName;
    map['description'] = description;
    map['start_date'] = startDate;
    map['scheme_duration'] = schemeDuration;
    map['duration_type'] = durationType;
    map['end_date'] = endDate;
    map['lucky_draw_date'] = luckyDrawDate;
    map['joining_date'] = joiningDate;
    map['joining_status'] = joiningStatus;
    map['scheme_close'] = schemeClose;
    map['scheme_amount'] = schemeAmount;
    map['total_amount'] = totalAmount;
    map['under_of_user'] = underOfUser;
    map['status'] = status;
    map['cluster_id'] = clusterId;
    map['branch_id'] = branchId;
    map['scheme_members'] = schemeMembers;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    return map;
  }
}
