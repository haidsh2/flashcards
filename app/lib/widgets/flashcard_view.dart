import 'package:flutter/material.dart';
import '../models/flashcard.dart';

class FlashcardView extends StatefulWidget {
  final Flashcard card;
  const FlashcardView({super.key, required this.card});

  @override
  State<FlashcardView> createState() => _FlashcardViewState();
}

class _FlashcardViewState extends State<FlashcardView> {
  bool _showBack = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _showBack = !_showBack),
      child: Card(
        margin: const EdgeInsets.all(16),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Text(
              _showBack ? widget.card.back : widget.card.front,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
