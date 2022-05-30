import 'package:equatable/equatable.dart';

class Episode extends Equatable {
  final String date;
  final String episode;
  final int id;
  final String name;
  final String url;

  const Episode({
    required this.date,
    required this.episode,
    required this.id,
    required this.name,
    required this.url,
  });

  @override
  List<Object?> get props => [
    date,
    episode,
    id,
    name,
    url,
  ];
}
