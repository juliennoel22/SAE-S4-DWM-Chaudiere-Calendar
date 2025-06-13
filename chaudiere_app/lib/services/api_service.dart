import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/event.dart';
import '../models/event_detail.dart';

class ApiService {
  static const String apiUrl = 'http://localhost:8080/api/events?sort=titre';

  static Future<List<Event>> fetchEvents() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((e) => Event.fromJson(e)).toList();
    } else {
      throw Exception('Erreur lors du chargement des événements');
    }
  }

  static Future<EventDetailModel> fetchEventDetail(int id) async {
    final response = await http.get(Uri.parse('http://localhost:8080/api/evenements/$id'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return EventDetailModel.fromJson(data);
    } else {
      throw Exception('Erreur lors du chargement du détail de l\'événement');
    }
  }

  static Future<List<String>> fetchCategories() async {
    final response = await http.get(Uri.parse('http://localhost:8080/api/categories'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      // Adapte selon la structure de ta réponse
      return data.map((c) => c['label'] as String).toList();
    } else {
      throw Exception('Erreur lors du chargement des catégories');
    }
  }
}