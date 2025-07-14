import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/deck.dart';
import '../services/database_service.dart';
import 'deck_detail_screen.dart';

class DeckListScreen extends StatelessWidget {
  const DeckListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<DatabaseService>(context);
    final decks = db.decks;
    return Scaffold(
      appBar: AppBar(title: const Text('Decks')),
      body: ListView.builder(
        itemCount: decks.length,
        itemBuilder: (context, index) {
          final deck = decks[index];
          return ListTile(
            title: Text(deck.name),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DeckDetailScreen(deckId: deck.id),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final controller = TextEditingController();
          final name = await showDialog<String>(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('New Deck'),
              content: TextField(controller: controller),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel')),
                TextButton(
                    onPressed: () =>
                        Navigator.pop(context, controller.text.trim()),
                    child: const Text('Create')),
              ],
            ),
          );
          if (name != null && name.isNotEmpty) {
            final deck = Deck(id: DateTime.now().toIso8601String(), name: name);
            await db.addDeck(deck);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
