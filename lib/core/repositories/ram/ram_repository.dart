import 'package:rick_and_morty/core/data_sources/ram_data_source.dart';
import 'package:rick_and_morty/core/repositories/ram/iram_repository.dart';

class RamRepository extends IRamRepository {
  final RamDataSource _ramDataSource;

  RamRepository({
    required RamDataSource ramDataSource,
  }) : _ramDataSource = ramDataSource;

  //@override
  //Future<Result<Ram, BackendError>> getRam({
  //  required int numPokedex,
  //}) async {
  //  final result = await _ramDataSource.getAllRams(
  //    numPokedex: numPokedex,
  //  );
  //
  //  return result.when(
  //    fail: (fail) => Fail(fail),
  //    success: (success) => Success(success.toEntity()),
  //  );
  //}
}
