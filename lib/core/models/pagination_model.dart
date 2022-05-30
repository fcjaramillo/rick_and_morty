import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/core/entities/pagination.dart';
import 'package:rick_and_morty/core/models/character_model.dart';

class PaginationModel extends Equatable {
  final InfoModel info;
  final List<CharacterModel> results;

  const PaginationModel({
    required this.info,
    required this.results,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
      info: InfoModel.fromJson(json["info"]),
      results: (json["results"] as List<dynamic>)
          .map((e) => CharacterModel.fromJson(e))
          .toList(),
    );
  }

  Pagination toEntity() {
    return Pagination(
      info: info.toEntity(),
      results: results.map((e) => e.toEntity()).toList(),
    );
  }

  @override
  List<Object?> get props => [
        info,
        results,
      ];
}

class InfoModel extends Equatable {
  final int count;
  final String? next;
  final int pages;
  final String? prev;

  const InfoModel({
    required this.count,
    this.next,
    required this.pages,
    this.prev,
  });

  factory InfoModel.fromJson(Map<String, dynamic> json) {
    return InfoModel(
      count: json["count"] ?? 0,
      next: json["next"],
      pages: json["pages"] ?? 0,
      prev: json["prev"],
    );
  }

  Info toEntity() {
    return Info(
      count: count,
      pages: pages,
    );
  }

  @override
  List<Object?> get props => [
        count,
        next,
        pages,
        prev,
      ];
}
