import 'package:rick_and_morty/core/api/api_utils.dart';
import 'package:rick_and_morty/core/models/episode_model.dart';
import 'package:rick_and_morty/core/models/pagination_model.dart';
import 'package:rick_and_morty/core/models/result.dart';

const String _kRootPath = 'api/';

class RamDataSource {
  final ApiUtils _apiUtils;

  RamDataSource({
    required ApiUtils apiUtils,
  }) : _apiUtils = apiUtils;

  Future<Result<PaginationModel, BackendError>> getAllCharacter({
    required int page,
  }) async {
    final result = await _apiUtils.makeRequest(
      method: Method.get,
      path: "$_kRootPath/character/",
      queryParameters: {
        "page": page.toString(),
      },
    );
    return result.when(
      fail: (fail) => Fail(fail),
      success: (success) => Success(PaginationModel.fromJson(success)),
    );
  }

  Future<Result<PaginationModel, BackendError>> getCharacterWithFilter({
    String? gender,
    String? name,
    String? page,
    String? status,
  }) async {
    Map<String, dynamic> parameters = {};

    if(gender != null && gender != 'all') parameters["gender"] = gender;
    if(name != null) parameters["name"] = name;
    parameters["page"] = page ?? '1';
    if(status != null && status != 'all') parameters["status"] = status;

    final result = await _apiUtils.makeRequest(
      method: Method.get,
      path: "/api/character/",
      queryParameters: parameters,
    );
    return result.when(
      fail: (fail) => Fail(fail),
      success: (success) => Success(PaginationModel.fromJson(success)),
    );
  }

  Future<Result<EpisodeModel, BackendError>> getEpisodeByNumber({
    required String episode,
  }) async {
    final result = await _apiUtils.makeRequest(
      method: Method.get,
      path: "/api/episode$episode",
    );
    return result.when(
      fail: (fail) => Fail(fail),
      success: (success) => Success(EpisodeModel.fromJson(success)),
    );
  }

  Future<Result<List<EpisodeModel>, BackendError>> getAllEpisodeByNumbers({
    required List episodes,
  }) async {
    final result = await _apiUtils.makeRequest(
      method: Method.get,
      path: "/api/episode/$episodes",
    );
    return result.when(
      fail: (fail) => Fail(fail),
      success: (success) => Success(success),
    );
  }
}
