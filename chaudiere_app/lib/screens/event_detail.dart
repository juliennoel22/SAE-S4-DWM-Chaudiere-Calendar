import 'package:flutter/material.dart';
import '../models/event.dart';
import '../models/event_detail.dart';
import '../services/api_service.dart';

class EventDetail extends StatelessWidget {
  final Event event;
  const EventDetail({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(event.title)),
      body: FutureBuilder<EventDetailModel>(
        future: ApiService.fetchEventDetail(event.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erreur : ${snapshot.error}'));
          }
          final detail = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                Text('Titre : ${detail.title}', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('Catégorie : ${detail.categorie}', style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 8),
                Text('Date début : ${detail.dateDebut}', style: const TextStyle(fontSize: 16)),
                Text('Date fin : ${detail.dateFin}', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text('Heure : ${detail.heure}', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text('Prix : ${detail.prix}', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text('Description :', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(detail.descriptionMd),
                const SizedBox(height: 8),
                Text('Créé par : ${detail.createdBy}', style: const TextStyle(fontSize: 14, color: Colors.grey)),
                Text('Publié : ${detail.published == 1 ? "Oui" : "Non"}', style: const TextStyle(fontSize: 14, color: Colors.grey)),
                Text('Créé le : ${detail.createdAt}', style: const TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          );
        },
      ),
    );
  }
}