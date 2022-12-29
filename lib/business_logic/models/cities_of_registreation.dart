class CitiesOfRegisterration {

  List<Governorate>? governorate;

  CitiesOfRegisterration({this.governorate});

  CitiesOfRegisterration.fromJson(Map<String, dynamic> json) {

    if (json['governorate'] != null) {
      governorate = <Governorate>[];
      json['governorate'].forEach((v) {
        governorate!.add(new Governorate.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.governorate != null) {
      data['governorate'] = this.governorate!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Governorate {
  var id;
  var name;
  var createdAt;
  var updatedAt;
  List<Citie>? citie;

  Governorate(
      {this.id,
        this.name,
        this.createdAt,
        this.updatedAt,
        this.citie});

  Governorate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['governorate_name_ar'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['citie'] != null) {
      citie = <Citie>[];
      json['citie'].forEach((v) {
        citie!.add(new Citie.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['governorate_name_ar'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.citie != null) {
      data['citie'] = this.citie!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Citie {
  var id;
  var name;
  var governorateId;
  var createdAt;
  var updatedAt;

  Citie(
      {this.id,
        this.name,
        this.governorateId,
        this.createdAt,
        this.updatedAt});

  Citie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['city_name_ar'];
    governorateId = json['governorate_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['city_name_ar'] = this.name;
    data['governorate_id'] = this.governorateId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
