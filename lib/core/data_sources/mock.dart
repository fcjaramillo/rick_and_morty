import 'package:rick_and_morty/core/api/api_utils.dart';
import 'package:rick_and_morty/core/models/result.dart';

class Mock {
  final ApiUtils _apiUtils;

  Mock({
    required ApiUtils apiUtils,
  }) : _apiUtils = apiUtils;

  @override
  Future<Result<dynamic, BackendError>> getAllCharacter({
    required int page,
  }) async {
    final result = await _apiUtils.makeRequest(
        mockResponseFile: page.toString(),
        mockFile: "all_characters.json",
        method: Method.get,
        path: "/api/character/",
        queryParameters: {"page": page.toString()});
    return result.when(
        fail: (fail) => Fail(fail), success: (success) => Success(success));
  }

  @override
  Future<Result<dynamic, BackendError>> getCharacterWithFilter({
    required String? gender,
    required String? status,
    required String? name,
    required int page,
  }) async {
    final result = await _apiUtils.makeRequest(
        mockResponseFile: page.toString(),
        method: Method.get,
        path: "/api/character/",
        queryParameters: {
          "page": page.toString(),
          "gender": gender,
          "status": status,
          "name": name,
        });
    return result.when(
        fail: (fail) => Fail(fail), success: (success) => Success(success));
  }

  @override
  Future<Result<dynamic, BackendError>> getEpisodeByNumber({
    required String episode,
  }) async {
    final result = await _apiUtils.makeRequest(
      mockResponseFile: "2",
      method: Method.get,
      path: "/api/episode$episode",
    );
    return result.when(
        fail: (fail) => Fail(fail), success: (success) => Success(success));
  }

  @override
  Future<Result<dynamic, BackendError>> getAllEpisodeByNumber({
    required List episode,
  }) async {
    final result = await _apiUtils.makeRequest(
      mockResponseFile: int.parse(episode[0].toString()).toString(),
      method: Method.get,
      path: "/api/episode/$episode",
    );
    return result.when(
        fail: (fail) => Fail(fail), success: (success) => Success(success));
  }
}
