import 'package:hive/hive.dart';
import 'package:rick_and_morty/core/entities/character.dart';
import 'package:rick_and_morty/core/entities/episode.dart';

part 'character_db.g.dart';

@HiveType(typeId: 0)
class CharacterDb {
  @HiveField(0)
  String created;
  @HiveField(1)
  List<String> episodes;
  @HiveField(2)
  String gender;
  @HiveField(3)
  int id;
  @HiveField(4)
  String image;
  @HiveField(5)
  String location;
  @HiveField(6)
  String name;
  @HiveField(7)
  String origin;
  @HiveField(8)
  String species;
  @HiveField(9)
  String status;
  @HiveField(10)
  String type;
  @HiveField(11)
  String url;
  @HiveField(12)
  String firstEpisodeDate;
  @HiveField(13)
  String firstEpisodeEpisode;
  @HiveField(14)
  int firstEpisodeId;
  @HiveField(15)
  String firstEpisodeName;
  @HiveField(16)
  String firstEpisodeUrl;

  CharacterDb({
    required this.created,
    required this.episodes,
    required this.gender,
    required this.id,
    required this.image,
    required this.location,
    required this.origin,
    required this.name,
    required this.species,
    required this.status,
    required this.type,
    required this.url,
    required this.firstEpisodeDate,
    required this.firstEpisodeEpisode,
    required this.firstEpisodeId,
    required this.firstEpisodeName,
    required this.firstEpisodeUrl,
  });

  Character toEntity() => Character(
        created: created,
        episodes: episodes,
        firstEpisode: Episode(
          date: firstEpisodeDate,
          episode: firstEpisodeEpisode,
          id: firstEpisodeId,
          name: firstEpisodeName,
          url: firstEpisodeUrl,
        ),
        gender: gender,
        id: id,
        image: image,
        location: location,
        origin: origin,
        name: name,
        species: species,
        status: status,
        type: type,
        url: url,
      );
}
