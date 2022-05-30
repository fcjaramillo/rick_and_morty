import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/core/entities/episode.dart';

class EpisodeModel extends Equatable {
  final String date;
  final String episode;
  final int id;
  final String name;
  final String url;

  const EpisodeModel({
    required this.date,
    required this.episode,
    required this.id,
    required this.name,
    required this.url,
  });

  factory EpisodeModel.fromJson(Map<dynamic, dynamic> json) {
    return EpisodeModel(
      date: json["air_date"],
      episode: json["episode"],
      id: json["id"],
      name: json["name"],
      url: json["url"],
    );
  }

  Episode toEntity() => Episode(
        date: date,
        episode: episode,
        id: id,
        name: name,
        url: url,
      );

  @override
  List<Object?> get props => [
        date,
        episode,
        id,
        name,
        url,
      ];
}
