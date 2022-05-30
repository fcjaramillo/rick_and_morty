import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/core/entities/episode.dart';

class Character extends Equatable {
  final String created;
  final List episodes;
  final Episode firstEpisode;
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

  const Character({
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

  Character copyWith({Episode? episode}) {
    return Character(
      created: created,
      episodes: episodes,
      firstEpisode: episode ?? firstEpisode,
      gender: gender,
      id: id,
      image: image,
      location: location,
      name: name,
      origin: origin,
      species: species,
      status: status,
      type: type,
      url: url,
    );
  }

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
