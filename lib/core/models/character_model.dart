import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/core/entities/character.dart';
import 'package:rick_and_morty/core/models/episode_model.dart';

class CharacterModel extends Equatable {
  final String created;
  final List episodes;
  final EpisodeModel firstEpisode;
  final String gender;
  final int id;
  final String image;
  final String location;
  final String name;
  final String origin;
  final String species;
  final String status;
  final String type;
  final String url;

  const CharacterModel({
    required this.created,
    required this.episodes,
    required this.firstEpisode,
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
  });

  factory CharacterModel.fromJson(Map<dynamic, dynamic> json) {
    return CharacterModel(
      created: json["created"] ?? '',
      episodes: json["episode"] == []
          ? []
          : (json["episode"] as List<dynamic>).toList(),
      firstEpisode: const EpisodeModel(
        episode: "",
        name: "",
        id: 0,
        url: "",
        date: "",
      ),
      gender: json["gender"] ?? "Unknown",
      id: json["id"] ?? 0,
      image: json["image"] ?? "http://via.placeholder.com/640x360",
      location: json["location"]["name"] ?? "",
      name: json["name"] ?? "",
      origin: json["origin"]["name"] ?? "",
      species: json["species"] ?? "",
      status: json["status"] ?? "",
      type: json["type"] ?? "",
      url: json["url"] ?? "",
    );
  }

  Character toEntity() => Character(
        created: created,
        episodes: episodes,
        firstEpisode: firstEpisode.toEntity(),
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

  @override
  List<Object?> get props => [
        created,
        episodes,
        firstEpisode,
        gender,
        id,
        image,
        location,
        name,
        status,
        species,
        type,
        url,
      ];
}
