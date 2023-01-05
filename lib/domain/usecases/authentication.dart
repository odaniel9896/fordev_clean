import '../entities/entities.dart';

abstract class Authentication {
  Future<AccoutEntity> auth(AuthenticationParams params);
}

class AuthenticationParams {
  final String email;
  final String secret;

  const AuthenticationParams({required this.email, required this.secret});

  Map<String, dynamic> toJson() =>
      <String, dynamic>{"email": email, "password": secret};
}
