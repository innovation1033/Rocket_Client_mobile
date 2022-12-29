class ProvincesStartEndModel {
  bool? status;
  String? errNum;
  String? msg;
  List<Province>? province;

  ProvincesStartEndModel({this.status, this.errNum, this.msg, this.province});

  ProvincesStartEndModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['province'] != null) {
      province = <Province>[];
      json['province'].forEach((v) {
        province!.add(new Province.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.province != null) {
      data['province'] = this.province!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Province {
  int? id;
  String? name;
  int? countryId;
  String? createdAt;
  String? updatedAt;

  Province(
      {this.id, this.name, this.countryId, this.createdAt, this.updatedAt});

  Province.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['country_id'] = this.countryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

