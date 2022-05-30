import 'package:flutter_riverpod/flutter_riverpod.dart';

final filterVisibleProvider = StateProvider<bool>((ref) => false);
final isFavoriteAllProvider = StateProvider<bool>((ref) => false);
final primaryIndexProvider = StateProvider<int>((ref) => 0);
final secondaryIndexProvider = StateProvider<int>((ref) => 0);
