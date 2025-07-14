import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/deck.dart';
import '../models/flashcard.dart';
import '../services/database_service.dart';
import 'study_screen.dart';

class DeckDetailScreen extends StatelessWidget {
  final String deckId;
  const DeckDetailScreen({super.key, required this.deckId});

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<DatabaseService>(context);
    final deck = db.decks.firstWhere((d) => d.id == deckId);
    return Scaffold(
      appBar: AppBar(title: Text(deck.name)),
      body: ListView.builder(
        itemCount: deck.cards.length,
        itemBuilder: (context, index) {
          final card = deck.cards[index];
          return ListTile(
            title: Text(card.front),
            subtitle: Text(card.back),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => StudyScreen(deckId: deckId),
            ),
          );
        },
        label: const Text('Study'),
        icon: const Icon(Icons.play_arrow),
      ),
    );
  }
}
