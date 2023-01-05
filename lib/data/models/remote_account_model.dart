import '../../domain/entities/entities.dart';

import '../http/http.dart';

class RemoteAccoutModel {
  final String accessToken;

  const RemoteAccoutModel(this.accessToken);

  factory RemoteAccoutModel.fromJson(Map json) {
    if (!json.containsKey("accessToken")) {
      throw HttpError.invalidData;
    }
    return RemoteAccoutModel(json["accessToken"]);
  }

  AccoutEntity toEntity() => AccoutEntity(accessToken);
}
