class UserModel {
  String? name;
  String? email;
  String? address;
  String? contact;
  String? uid;

  UserModel({this.name, this.email, this.address, this.contact, this.uid});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    address = json['address'];
    contact = json['contact'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['address'] = this.address;
    data['contact'] = this.contact;
    data['uid'] = this.uid;
    return data;
  }
}