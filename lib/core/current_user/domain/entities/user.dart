class User {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String country;
  final String city;
  final String address;
  final String role;
  final String? loginToken;
  final String? profileImagePath;
  final String? id;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.country,
    required this.city,
    required this.address,
    required this.role,
    required this.loginToken, this.profileImagePath, this.id,
  });

  User copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? country,
    String? city,
    String? address,
    String? role,
    String? loginToken,
    String? profileImagePath,
    String? id,
  }) {
    return User(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      country: country ?? this.country,
      city: city ?? this.city,
      address: address ?? this.address,
      role: role ?? this.role,
      loginToken: loginToken ?? this.loginToken,
      profileImagePath: profileImagePath ?? this.profileImagePath,
      id: id ?? this.id,
    );
  }

  bool get isLoggedIn => loginToken != null && loginToken!.isNotEmpty;
}
