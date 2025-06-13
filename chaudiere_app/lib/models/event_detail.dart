class EventDetailModel {
  final int id;
  final String title;
  final String descriptionMd;
  final String descriptionHtml;
  final String prix;
  final String dateDebut;
  final String dateFin;
  final String heure;
  final String categorie;
  final int published;
  final String createdBy;
  final List<dynamic> images;
  final String createdAt;

  EventDetailModel({
    required this.id,
    required this.title,
    required this.descriptionMd,
    required this.descriptionHtml,
    required this.prix,
    required this.dateDebut,
    required this.dateFin,
    required this.heure,
    required this.categorie,
    required this.published,
    required this.createdBy,
    required this.images,
    required this.createdAt,
  });

  factory EventDetailModel.fromJson(Map<String, dynamic> json) {
    return EventDetailModel(
      id: json['id'],
      title: json['titre'],
      descriptionMd: json['description_md'] ?? '',
      descriptionHtml: json['description_html'] ?? '',
      prix: json['prix'] ?? '',
      dateDebut: json['date_debut'] ?? '',
      dateFin: json['date_fin'] ?? '',
      heure: json['heure'] ?? '',
      categorie: json['categorie'] ?? '',
      published: json['published'] ?? 0,
      createdBy: json['created_by'] ?? '',
      images: json['images'] ?? [],
      createdAt: json['created_at'] ?? '',
    );
  }
}