import 'package:flutter/material.dart';
// Si tu utilises un .env pour des configs, décommente la ligne suivante :
// import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'chaudiere_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  runApp(const ChaudiereApp());
}
