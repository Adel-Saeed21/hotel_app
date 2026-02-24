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

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.country,
    required this.city,
    required this.address,
    required this.role,
    required this.loginToken,
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
    );
  }

  bool get isLoggedIn => loginToken != null && loginToken!.isNotEmpty;
}
