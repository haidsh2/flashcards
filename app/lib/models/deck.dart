import 'flashcard.dart';

class Deck {
  String id;
  String name;
  List<Flashcard> cards;

  Deck({required this.id, required this.name, this.cards = const []});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'cards': cards.map((c) => c.toJson()).toList(),
      };

  factory Deck.fromJson(Map<String, dynamic> json) => Deck(
        id: json['id'] as String,
        name: json['name'] as String,
        cards: (json['cards'] as List<dynamic>? ?? [])
            .map((e) => Flashcard.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
