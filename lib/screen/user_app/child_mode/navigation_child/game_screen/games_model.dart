class GameModel {
  final int id;
  final String name;
  final String description;
  final String url; // Add URL field

  GameModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.url});

  factory GameModel.fromJson(Map<String, dynamic> json) {
    return GameModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'url': url,
    };
  }
}
