class Event {
  final int id;
  final String title;
  final String category;
  final String date;
  final String url;

  Event({
    required this.id,
    required this.title,
    required this.category,
    required this.date,
    required this.url,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['titre'],
      category: json['categorie'] ?? 'Sans catégorie',
      date: json['date'],
      url: json['url'],
    );
  }
}