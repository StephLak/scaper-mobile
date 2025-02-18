class AuthRequest {
  AuthRequest({
    required this.email,
    required this.password,
  });

  late String email;
  late String password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    return map;
  }
}
