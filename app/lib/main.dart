import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/database_service.dart';
import 'screens/deck_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = DatabaseService();
  await db.init();
  runApp(FlashcardsApp(databaseService: db));
}

class FlashcardsApp extends StatelessWidget {
  final DatabaseService databaseService;
  const FlashcardsApp({super.key, required this.databaseService});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: databaseService,
      child: MaterialApp(
        title: 'Flashcards',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: const DeckListScreen(),
      ),
    );
  }
}
