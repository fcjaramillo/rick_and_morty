import 'package:rick_and_morty/core/data_sources/ram_data_source.dart';
import 'package:rick_and_morty/core/entities/episode.dart';
import 'package:rick_and_morty/core/entities/pagination.dart';
import 'package:rick_and_morty/core/models/result.dart';
import 'package:rick_and_morty/core/repositories/ram/iram_repository.dart';

class RamRepository extends IRamRepository {
  final RamDataSource _ramDataSource;

  RamRepository({
    required RamDataSource ramDataSource,
  }) : _ramDataSource = ramDataSource;

  @override
  Future<Result<Pagination, BackendError>> getAllCharacter({
    required int page,
  }) async {
    final result = await _ramDataSource.getAllCharacter(
      page: page,
    );

    return result.when(
      fail: (fail) => Fail(fail),
      success: (success) => Success(success.toEntity()),
    );
  }

  @override
  Future<Result<Pagination, BackendError>> getCharacterWithFilter({
    String? gender,
    String? name,
    String? page,
    String? status,
  }) async {
    final result = await _ramDataSource.getCharacterWithFilter(
      gender: gender,
      name:  name,
      page: page,
      status: status,
    );

    return result.when(
      fail: (fail) => Fail(fail),
      success: (success) => Success(success.toEntity()),
    );
  }

  Future<Result<Episode, BackendError>> getEpisodeByNumber({
    required String episode,
  }) async {
    final result = await _ramDataSource.getEpisodeByNumber(
      episode: episode,
    );

    return result.when(
      fail: (fail) => Fail(fail),
      success: (success) => Success(success.toEntity()),
    );
  }

  @override
  Future<Result<List<Episode>, BackendError>> getAllEpisodeByNumbers({
    required List episodes,
  }) async {
    final result = await _ramDataSource.getAllEpisodeByNumbers(
      episodes: episodes,
    );

    return result.when(
      fail: (fail) => Fail(fail),
      success: (success) => Success(success.map((e) => e.toEntity()).toList()),
    );
  }
}
