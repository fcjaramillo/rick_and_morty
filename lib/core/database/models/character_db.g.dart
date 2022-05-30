// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CharacterDbAdapter extends TypeAdapter<CharacterDb> {
  @override
  final int typeId = 0;

  @override
  CharacterDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CharacterDb(
      created: fields[0] as String,
      episodes: (fields[1] as List).cast<String>(),
      gender: fields[2] as String,
      id: fields[3] as int,
      image: fields[4] as String,
      location: fields[5] as String,
      origin: fields[7] as String,
      name: fields[6] as String,
      species: fields[8] as String,
      status: fields[9] as String,
      type: fields[10] as String,
      url: fields[11] as String,
      firstEpisodeDate: fields[12] as String,
      firstEpisodeEpisode: fields[13] as String,
      firstEpisodeId: fields[14] as int,
      firstEpisodeName: fields[15] as String,
      firstEpisodeUrl: fields[16] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CharacterDb obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.created)
      ..writeByte(1)
      ..write(obj.episodes)
      ..writeByte(2)
      ..write(obj.gender)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.location)
      ..writeByte(6)
      ..write(obj.name)
      ..writeByte(7)
      ..write(obj.origin)
      ..writeByte(8)
      ..write(obj.species)
      ..writeByte(9)
      ..write(obj.status)
      ..writeByte(10)
      ..write(obj.type)
      ..writeByte(11)
      ..write(obj.url)
      ..writeByte(12)
      ..write(obj.firstEpisodeDate)
      ..writeByte(13)
      ..write(obj.firstEpisodeEpisode)
      ..writeByte(14)
      ..write(obj.firstEpisodeId)
      ..writeByte(15)
      ..write(obj.firstEpisodeName)
      ..writeByte(16)
      ..write(obj.firstEpisodeUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CharacterDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
