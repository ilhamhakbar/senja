class TempatDuduk {
  int id;
  int x;
  int y;
  String condition;
  int size;
  String orientation;

  TempatDuduk({this.size, this.condition, this.id, this.x, this.y, this.orientation});

  factory TempatDuduk.fromJson(Map<String, dynamic> json){
    return TempatDuduk(
      id: json['id'],
      x: json['x'],
      y: json['y'],
      condition: json['condition'],
      size: json['size'],
      orientation:  json['orientation']
    );
  }
}