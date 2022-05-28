import 'package:rick_and_morty/core/api/api_utils.dart';

const String _kRootPathV2 = 'api/v2';

class RamDataSource {
  final ApiUtils _apiUtils;

  RamDataSource({
    required ApiUtils apiUtils,
  }) : _apiUtils = apiUtils;

  /*Future<Result<PokemonModel, BackendError>> getAllPokemons({
    required int numPokedex,
  }) async {
    final String path = '$_kRootPathV2/pokemon';

    Result<dynamic, BackendError> result = await _apiUtils.makeRequest(
      method: Method.get,
      path: path,
    );

    return result.when(
      fail: (fail) => Fail(fail),
      success: (success) {
        PokemonModel pokemon = PokemonModel.fromJson(success['results'][0]);
        return Success(pokemon);
      },
    );
  }*/
}
