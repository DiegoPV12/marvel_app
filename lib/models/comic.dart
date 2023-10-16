class Comic {
  final int id;
  final String title;
  final String thumbnailUrl;

  Comic({required this.id, required this.title, required this.thumbnailUrl});

  factory Comic.fromJson(Map<String, dynamic> json) {
    return Comic(
      id: json['id'],
      title: json['title'],
      thumbnailUrl: "${json['thumbnail']['path']}.${json['thumbnail']['extension']}",
    );
  }
}
