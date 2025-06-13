import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/event.dart';
import '../services/api_service.dart';
import 'event_detail.dart';
import '../providers/theme_provider.dart';

class EventsMaster extends StatefulWidget {
  const EventsMaster({super.key});

  @override
  State<EventsMaster> createState() => _EventsMasterState();
}

class _EventsMasterState extends State<EventsMaster> {
  List<Event> _allEvents = [];
  List<Event> _filteredEvents = [];
  bool _isLoading = true;

  List<String> _categories = [];
  String? _selectedCategory;

  String _sortBy = 'titre'; 

  @override
  void initState() {
    super.initState();
    _loadAll();
  }

  Future<void> _loadAll() async {
    setState(() {
      _isLoading = true;
    });
    await Future.wait([
      _fetchEvents(),
      _fetchCategories(),
    ]);
    setState(() {
      _isLoading = false;
    });
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

  Future<void> _fetchCategories() async {
  try {
    final categories = await ApiService.fetchCategories();
    setState(() {
      _categories = categories;
    });
  } catch (e) {
    // Affiche une erreur ou ignore
  } finally {
    setState(() {
      _isLoading = false;
    });
  }
}

  void _filterEvents(String value) {
    setState(() {
      _filteredEvents = _allEvents
          .where((event) =>
              event.title.toLowerCase().contains(value.toLowerCase()) &&
              (_selectedCategory == null || event.category == _selectedCategory))
          .toList();
    });
    _sortEvents();
  }

  void _onCategoryChanged(String? category) {
    setState(() {
      _selectedCategory = category;
      _filteredEvents = _allEvents
          .where((event) =>
              (_selectedCategory == null || event.category == _selectedCategory))
          .toList();
    });
    _sortEvents();
  }

  void _sortEvents() {
    setState(() {
      _filteredEvents.sort((a, b) {
        switch (_sortBy) {
          case 'date-asc':
            return a.date.compareTo(b.date);
          case 'date-desc':
            return b.date.compareTo(a.date);
          case 'categorie':
            return a.category.toLowerCase().compareTo(b.category.toLowerCase());
          case 'titre':
          default:
            return a.title.toLowerCase().compareTo(b.title.toLowerCase());
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Événements'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0), 
            child: Consumer<ThemeProvider>(
              builder: (context, themeProvider, _) => IconButton(
                icon: Icon(
                  themeProvider.themeMode == ThemeMode.dark
                      ? Icons.light_mode
                      : Icons.dark_mode,
                ),
                onPressed: () {
                  themeProvider.toggleTheme(themeProvider.themeMode != ThemeMode.dark);
                },
              ),
            ),
          ),
        ],
      ),
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
                if (_categories.isNotEmpty)
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    child: DropdownButtonFormField<String>(
                      value: _selectedCategory,
                      decoration: const InputDecoration(
                        labelText: 'Filtrer par catégorie',
                        border: OutlineInputBorder(),
                      ),
                      items: [
                        const DropdownMenuItem(
                            value: null, child: Text('Toutes les catégories')),
                        ..._categories.map((cat) => DropdownMenuItem(
                              value: cat,
                              child: Text(cat),
                            )),
                      ],
                      onChanged: (value) {
                        _onCategoryChanged(value);
                        _filterEvents(''); // Pour appliquer le filtre combiné
                      },
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: DropdownButtonFormField<String>(
                    value: _sortBy,
                    decoration: const InputDecoration(
                      labelText: 'Trier par',
                      border: OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(value: 'date-asc', child: Text('Date (ascendante)')),
                      DropdownMenuItem(value: 'date-desc', child: Text('Date (descendante)')),
                      DropdownMenuItem(value: 'titre', child: Text('Titre (A-Z)')),
                      DropdownMenuItem(value: 'categorie', child: Text('Catégorie (A-Z)')),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _sortBy = value;
                        });
                        _sortEvents();
                      }
                    },
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