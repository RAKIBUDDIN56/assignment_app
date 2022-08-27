class SigninModel {
  SigninModel({
    required this.token,
    required this.id,
  });

  String token;
  String id;

  factory SigninModel.fromJson(Map<String, dynamic> json) => SigninModel(
        token: json["token"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "id": id,
      };
}
