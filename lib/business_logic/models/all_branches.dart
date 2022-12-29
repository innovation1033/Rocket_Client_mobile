class AllBranches {
  bool? status;
  var errNum;
  var msg;
  List<Branches>? branches;

  AllBranches({this.status, this.errNum, this.msg, this.branches});

  AllBranches.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['branches'] != null) {
      branches = <Branches>[];
      json['branches'].forEach((v) {
        branches!.add(new Branches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.branches != null) {
      data['branches'] = this.branches!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Branches {
  int? id;
  var name;
  var address;
  var location;
  var photo;
  var phone;
  var email;
  int? areaId;
  var createdAt;
  var updatedAt;
  var imagePath;
  Area? area;

  Branches(
      {this.id,
        this.name,
        this.address,
        this.location,
        this.photo,
        this.phone,
        this.email,
        this.areaId,
        this.createdAt,
        this.updatedAt,
        this.imagePath,
        this.area});

  Branches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    location = json['location'];
    photo = json['photo'];
    phone = json['phone'];
    email = json['email'];
    areaId = json['area_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imagePath = json['image_path'];
    area = json['area'] != null ? new Area.fromJson(json['area']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['location'] = this.location;
    data['photo'] = this.photo;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['area_id'] = this.areaId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_path'] = this.imagePath;
    if (this.area != null) {
      data['area'] = this.area!.toJson();
    }
    return data;
  }
}

class Area {
  int? id;
  var name;
  int? provinceId;
  var createdAt;
  var updatedAt;
  Province? province;

  Area(
      {this.id,
        this.name,
        this.provinceId,
        this.createdAt,
        this.updatedAt,
        this.province});

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    provinceId = json['province_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    province = json['province'] != null
        ? new Province.fromJson(json['province'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['province_id'] = this.provinceId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.province != null) {
      data['province'] = this.province!.toJson();
    }
    return data;
  }
}

class Province {
  int? id;
  var name;
  int? countryId;
  var createdAt;
  var updatedAt;

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
