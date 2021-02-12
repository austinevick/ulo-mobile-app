class UserData {
  final String displayName;
  final String email;
  UserData({
    this.displayName,
    this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'displayName': displayName,
      'email': email,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserData(
      displayName: map['displayName'],
      email: map['email'],
    );
  }

  @override
  String toString() => 'UserData(displayName: $displayName, email: $email)';
}
