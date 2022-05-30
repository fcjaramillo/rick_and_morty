import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/core/database/database.dart';

final databaseProvider = Provider<Database>((ref) {
  final Database database = Database();

  ref.onDispose(() {
    database.close();
  });

  return database;
});