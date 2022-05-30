import 'package:rick_and_morty/core/entities/episode.dart';
import 'package:rick_and_morty/core/entities/pagination.dart';
import 'package:rick_and_morty/core/models/result.dart';

abstract class IRamRepository {
  Future<Result<Pagination, BackendError>> getAllCharacter({
    required int page,
  });

  Future<Result<Pagination, BackendError>> getCharacterWithFilter({
    String? gender,
    String? name,
    String? page,
    String? status,
  });

  Future<Result<Episode, BackendError>> getEpisodeByNumber({
    required String episode,
  });

  Future<Result<List<Episode>, BackendError>> getAllEpisodeByNumbers({
    required List episodes,
  });
}
