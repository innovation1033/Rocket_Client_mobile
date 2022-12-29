class AreaStartEndModel {
  bool? status;
  String? errNum;
  String? msg;
  List<Area>? area;

  AreaStartEndModel({this.status, this.errNum, this.msg, this.area});

  AreaStartEndModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['area'] != null) {
      area = <Area>[];
      json['area'].forEach((v) {
        area!.add(new Area.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.area != null) {
      data['area'] = this.area!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Area {
  int? id;
  String? name;
  int? provinceId;
  String? createdAt;
  String? updatedAt;

  Area({this.id, this.name, this.provinceId, this.createdAt, this.updatedAt});

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    provinceId = json['province_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['province_id'] = this.provinceId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
