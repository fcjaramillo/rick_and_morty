import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty/core/api/api_utils.dart';
import 'package:rick_and_morty/core/cubit/ram_cubit.dart';
import 'package:rick_and_morty/core/data_sources/mock.dart';
import 'package:rick_and_morty/core/data_sources/ram_data_source.dart';
import 'package:rick_and_morty/core/entities/character.dart';
import 'package:rick_and_morty/core/entities/episode.dart';
import 'package:rick_and_morty/core/models/result.dart';
import 'package:rick_and_morty/core/repositories/ram/ram_repository.dart';

void main() {
  ApiUtils apiUtils = ApiUtils(
    client: Dio(BaseOptions(
      baseUrl: "rickandmortyapi.com",
      connectTimeout: 5000,
      receiveTimeout: 5000,
    )),
    host: "rickandmortyapi.com",
    tokenAuthorization: '',
  );
  Mock mock = Mock(apiUtils: apiUtils);
  RamDataSource ramDataSource = RamDataSource(apiUtils: apiUtils);
  RamRepository ramRepository = RamRepository(ramDataSource: ramDataSource);
  String name = "Gadeon";

  Character character = const Character(
    id: 15,
    episodes: [
      "https://rickandmortyapi.com/api/episode/1",
      "https://rickandmortyapi.com/api/episode/2"
    ],
    created: "2017-15-04T18:48:46.250Z",
    firstEpisode: Episode(id: 0, episode: '', name: "", url: "", date: ""),
    gender: "Male",
    image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
    name: "Rick Sanchez",
    species: "Human",
    status: "Alive",
    type: "Nose",
    url: "https://rickandmortyapi.com/api/character/1",
    origin: "Earth",
    location: "Earth",
  );

  group("Testing Group United Testing To Data", () {
    TestWidgetsFlutterBinding.ensureInitialized();

    test("Success response all character", () async {
      final Result<dynamic, BackendError> result =
          await mock.getAllCharacter(page: 1);
      expect(result.isSuccess, isTrue);
    });

    test("Failure response all character", () async {
      final Result<dynamic, BackendError> result =
          await mock.getAllCharacter(page: -1);
      expect(result.isFail, isTrue);
    });

    test("Failure response Name character", () async {
      final Result<dynamic, BackendError> result =
          await mock.getCharacterWithFilter(
              page: 0, name: name, gender: 'Human', status: 'Alive');
      expect(result.isFail, isTrue);
    });

    test("Failure response gender and status character", () async {
      final Result<dynamic, BackendError> result = await mock
          .getCharacterWithFilter(page: -1, gender: "", status: "", name: '');
      expect(result.isFail, isTrue);
    });
  });
}
