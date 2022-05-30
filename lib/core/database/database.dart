import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_and_morty/core/database/models/character_db.dart';

part 'character_handler.dart';

class Database {
  Future initDB() async {
    await Hive.initFlutter();
    if(!Hive.isAdapterRegistered(0)){
      Hive.registerAdapter(CharacterDbAdapter());
    }
  }

  close() => Hive.close();

  CharacterHandler<CharacterDb> characters() => CharacterHandler<CharacterDb>();
}