import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/core/entities/character.dart';

final filterVisibleProvider = StateProvider<bool>((ref) => false);
final isFavoriteAllProvider = StateProvider<bool>((ref) => false);
final primaryIndexProvider = StateProvider<int>((ref) => 0);
final secondaryIndexProvider = StateProvider<int>((ref) => 0);
final favoritesCharactersProvider = StateProvider<List<Character>>((ref) => []);
