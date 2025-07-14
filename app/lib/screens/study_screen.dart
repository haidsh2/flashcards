import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/deck.dart';
import '../models/flashcard.dart';
import '../services/database_service.dart';
import '../widgets/flashcard_view.dart';

class StudyScreen extends StatefulWidget {
  final String deckId;
  const StudyScreen({super.key, required this.deckId});

  @override
  State<StudyScreen> createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen> {
  Flashcard? currentCard;

  @override
  void initState() {
    super.initState();
    loadNextCard();
  }

  void loadNextCard() {
    final db = Provider.of<DatabaseService>(context, listen: false);
    final deck = db.decks.firstWhere((d) => d.id == widget.deckId);
    final dueCards = deck.cards
        .where((c) => c.review.dueDate.isBefore(DateTime.now()))
        .toList();
    if (dueCards.isNotEmpty) {
      currentCard = dueCards.first;
    } else {
      currentCard = null;
    }
  }

  void gradeCard(int grade) async {
    final db = Provider.of<DatabaseService>(context, listen: false);
    final deck = db.decks.firstWhere((d) => d.id == widget.deckId);
    if (currentCard != null) {
      await db.reviewCard(deck, currentCard!, grade);
      loadNextCard();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Study')),
      body: currentCard == null
          ? const Center(child: Text('No cards due'))
          : Column(
              children: [
                Expanded(child: FlashcardView(card: currentCard!)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () => gradeCard(2),
                        child: const Text('Again')),
                    ElevatedButton(
                        onPressed: () => gradeCard(4),
                        child: const Text('Good')),
                    ElevatedButton(
                        onPressed: () => gradeCard(5),
                        child: const Text('Easy')),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
    );
  }
}
