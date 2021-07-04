class User {
  final String userId, email;
  String tokenid, refreshToken;
  DateTime expiresIn;
  User.fromjson(dynamic json)
      : this.email = json['email'],
        this.userId = json['localId'],
        this.tokenid = json['idToken'],
        this.refreshToken = json['refreshToken'],
        this.expiresIn = DateTime.now().add(
          Duration(
            seconds: int.parse(
              json['expiresIn'],
            ),
          ),
        );
}
