class UserModel {
  final String name;
  final String uid;
  final String profilePic;
  final String email;
  final String phoneNumber;
  final String address;
  final String age;
  final String cryptoWalletKey;

  UserModel({
    required this.address,
    required this.age,
    required this.cryptoWalletKey,
    required this.name,
    required this.email,
    required this.uid,
    required this.profilePic,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'uid': uid,
      'profilePic': profilePic,
      'phoneNumber': phoneNumber,
      'email': email,
      'address': address,
      'age': age,
      'cryptoWalletKey': cryptoWalletKey
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      uid: map['uid'] ?? '',
      profilePic: map['profilePic'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      email: map['email'] ?? '',
      cryptoWalletKey: map['cryptoWalletKey'] ?? '',
      address: map['address'] ?? '',
      age: map['age'] ?? '',
    );
  }
}
