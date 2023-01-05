import 'package:fordev/domain/entities/account_entity.dart';

class RemoteAccoutModel {
  final String accessToken;

  const RemoteAccoutModel(this.accessToken);

  factory RemoteAccoutModel.fromJson(Map json) =>
      RemoteAccoutModel(json["accessToken"]);

  AccoutEntity toEntity() => AccoutEntity(accessToken);
}
