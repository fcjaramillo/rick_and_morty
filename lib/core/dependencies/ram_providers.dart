import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/core/data_sources/ram_data_source.dart';
import 'package:rick_and_morty/core/dependencies/apis_providers.dart';
import 'package:rick_and_morty/core/repositories/ram/ram_repository.dart';

final ramDataSourceProvider = Provider((ref) => RamDataSource(
      apiUtils: ref.watch(ramApiProvider),
    ));

final ramRepositoryProvider = Provider((ref) => RamRepository(
      ramDataSource: ref.watch(ramDataSourceProvider),
    ));

/*final getRamUseCaseProvider = Provider(
  (ref) => GetRamUseCase(
    pokemonRepository: ref.watch(pokemonRepositoryProvider),
  ),
);*/
