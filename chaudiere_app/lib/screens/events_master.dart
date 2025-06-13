import 'package:flutter/material.dart';
import '../models/event.dart';
import '../services/api_service.dart';
import 'event_detail.dart';

class EventsMaster extends StatefulWidget {
  const EventsMaster({super.key});

  @override
  State<EventsMaster> createState() => _EventsMasterState();
}

class _EventsMasterState extends State<EventsMaster> {
  List<Event> _allEvents = [];
  List<Event> _filteredEvents = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchEvents();
  }

  Future<void> _fetchEvents() async {
    try {
      final events = await ApiService.fetchEvents();
      setState(() {
        _allEvents = events;
        _filteredEvents = events;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _filterEvents(String value) {
    setState(() {
      _filteredEvents = _allEvents
          .where((event) =>
              event.title.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Événements')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Rechercher par titre',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: _filterEvents,
                  ),
                ),
                Expanded(
                  child: _filteredEvents.isEmpty
                      ? const Center(child: Text('Aucun événement trouvé.'))
                      : ListView.builder(
                          itemCount: _filteredEvents.length,
                          itemBuilder: (context, index) {
                            final event = _filteredEvents[index];
                            return ListTile(
                              title: Text(event.title),
                              subtitle: Text(event.category),
                              trailing: Text(event.date),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EventDetail(event: event),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                ),
              ],
            ),
    );
  }
}