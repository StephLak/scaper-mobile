class PlatformUser {
  PlatformUser({
    required this.id,
    required this.email,
  });

  String? id;
  String? email;

  factory PlatformUser.fromJson(dynamic json, {bool isProfile = false}) {
    final tokenData = isProfile ? json['tokenable'] : json;
    return PlatformUser(
      id: tokenData['id'],
      email: tokenData["email"],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    return map;
  }
}
