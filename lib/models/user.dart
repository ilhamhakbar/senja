class User {
  String token;
  Data data;

  User({this.token, this.data});

  factory User.fromMap(Map<String, dynamic> json) => new User(
    token: json["token"] == null ? "Token tidak ada" : json["token"],
    data: json["data"] == null ? null : Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
        "token": token == null ? null : token,
        "data": data == null ? null : data.toMap(),
    };
}

class Data{
  String email;
  String name;
  String no_hp;

  Data({
    this.email,
    this.name,
    this.no_hp,
  });

  factory Data.fromMap(Map<String, dynamic> json) => new Data(
     email: json["email"] == null ? null : json["email"],
     name: json["username"] == null ? null : json["name"],
     no_hp: json["no_hp"] == null ? null : json["no_hp"],
  );

  Map<String, dynamic> toMap() => {
        "email": email == null ? null : email,
        "name": name == null ? null : name,
        "no_hp": no_hp == null ? null : no_hp,
    };
}

