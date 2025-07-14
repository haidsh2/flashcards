import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../models/deck.dart';
import '../models/flashcard.dart';
import 'sm2_service.dart';

class DatabaseService extends ChangeNotifier {
  static const _boxName = 'flashcardsBox';
  late Box<String> _box;
  final sm2 = SM2Service();

  Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox<String>(_boxName);
  }

  List<Deck> get decks =>
      _box.values.map((v) => Deck.fromJson(jsonDecode(v))).toList();

  Future<void> addDeck(Deck deck) async {
    await _box.put(deck.id, jsonEncode(deck.toJson()));
    notifyListeners();
  }

  Future<void> updateDeck(Deck deck) async {
    await _box.put(deck.id, jsonEncode(deck.toJson()));
    notifyListeners();
  }

  Future<void> deleteDeck(String id) async {
    await _box.delete(id);
    notifyListeners();
  }

  Future<void> reviewCard(
    Deck deck,
    Flashcard card,
    int grade,
  ) async {
    card.review = sm2.nextReview(card.review, grade);
    await updateDeck(deck);
  }
}
