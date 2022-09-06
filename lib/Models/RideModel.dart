class RideModel {
  final String distance;
  final String uid;
  final bool isSpeedLess20;
  final String points;
  final DateTime dateTime;

  RideModel({
    required this.dateTime,
    required this.distance,
    required this.uid,
    required this.isSpeedLess20,
    required this.points,
  });

  Map<String, dynamic> toJson() {
    return {
      'distance': distance,
      'uid': uid,
      'isSpeedLess20': isSpeedLess20,
      'points': points,
      'dateTime': dateTime.toIso8601String(),
    };
  }

  factory RideModel.fromJson(Map<String, dynamic> map) {
    return RideModel(
      uid: map['uid'] ?? '',
      isSpeedLess20: map['isSpeedLess20'] ?? false,
      points: map['points'] ?? '',
      distance: map['distance'] ?? '',
      dateTime: DateTime.parse(map['dateTime'] as String),
    );
  }
}
