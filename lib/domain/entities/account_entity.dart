class AccoutEntity {
  final String token;

  const AccoutEntity(this.token);

  factory AccoutEntity.fromJson(Map json) => AccoutEntity(json["accessToken"]);
}
