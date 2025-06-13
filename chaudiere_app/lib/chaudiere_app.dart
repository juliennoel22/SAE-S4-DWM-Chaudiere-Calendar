import 'package:flutter/material.dart';
import 'screens/events_master.dart';

class ChaudiereApp extends StatelessWidget {
  const ChaudiereApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'La Chaudière',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const EventsMaster(),
    );
  }
}