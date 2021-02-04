class Genre {
  final int id;
  final String name;
  Genre.fromjson(dynamic json)
      : this.id = json['id'],
        this.name = json['name'];
}
