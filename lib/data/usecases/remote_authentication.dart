import '../../domain/entities/entities.dart';

import '../../domain/helpers/helpers.dart';

import '../../domain/usecases/usecases.dart';

import '../http/http.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  const RemoteAuthentication({required this.httpClient, required this.url});

  Future<AccoutEntity> auth(AuthenticationParams params) async {
    final body = RemoteAuthenticationParams.fromDomain(params).toJson();
    try {
      final httpResponse = await httpClient.request(url: url, method: "post", body: body);
      return AccoutEntity.fromJson(httpResponse!);
    } on HttpError catch (error) {
      throw error == HttpError.unauthorized
          ? DomainError.invalidCredentials
          : DomainError.unexpected;
    }
  }
}

class RemoteAuthenticationParams {
  final String email;
  final String password;

  const RemoteAuthenticationParams(
      {required this.email, required this.password});

  factory RemoteAuthenticationParams.fromDomain(AuthenticationParams params) =>
      RemoteAuthenticationParams(email: params.email, password: params.secret);

  Map<String, dynamic> toJson() =>
      <String, dynamic>{"email": email, "password": password};
}
