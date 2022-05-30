import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/core/entities/character.dart';
import 'package:rick_and_morty/core/entities/pagination.dart';
import 'package:rick_and_morty/core/models/episode_model.dart';
import 'package:rick_and_morty/core/repositories/ram/ram_repository.dart';

part 'ram_state.dart';

class RamCubit extends Cubit<RamState> {
  final RamRepository _ramRepository;

  RamCubit({
    required RamRepository ramRepository,
  })  : _ramRepository = ramRepository,
        super(RamLoading());

  int page = 0;
  int pageSearch = 2;
  int pageFilter = 1;
  late int pages;
  late int count;
  String sGender = "All";
  String sStatus = "All";
  bool isFilter = false;
  List<Character> characters = [];
  Pagination data = const Pagination(
    info: Info(count: 0, pages: 0),
    results: [],
  );


  EpisodeModel episodeMock = const EpisodeModel(
    id: 0,
    episode: "",
    name: "",
    url: "",
    date: "",
  );

  int get countingPages => pages;

  Future getAllCharacter(int? paginate) async {
    try {
      if (data.results.isEmpty) {
        page = 0;
        emit(RamLoading());
      }
      final result =
          await _ramRepository.getAllCharacter(page: paginate ?? page + 1);
      if (result.isSuccess) {
        if (result.successRes != null) {
          data = result.successRes!;
        }
        if (data.results.isNotEmpty) {
          for (int i = 0; i < data.results.length; i++) {
            final singleEpisode = await _ramRepository.getEpisodeByNumber(
              episode:
                  data.results[i].episodes[0].toString().split('episode')[1],
            );
            if (singleEpisode.isSuccess) {
              final character = data.results[i].copyWith(
                episode: singleEpisode.successRes,
              );
              data.results[i] = character;
            }
          }
          characters = [
            ...characters,
            ...data.results,
          ];
          page++;
          pages = data.info.pages;
          count = data.info.count;
          emit(RamLoaded(characters: characters));
        } else {
          emit(RamLoaded(characters: characters));
        }
      } else {
        if (result.failRes!.err == "connectTimeout" ||
            result.failRes!.err == "sendTimeout" ||
            result.failRes!.err == "receiveTimeout") {
          emit(RamWithOutConnexion());
        } else {
          emit(RamError());
        }
      }
    } catch (e) {
      emit(RamError());
    }
  }

  Future getCharacterWithFilters({
    required bool clearData,
    String? gender,
    String? name,
    String? page,
    String? status,
  }) async {
    try {
      if (clearData) {
        emit(RamLoading());
        characters = [];
      }
      final result = await _ramRepository.getCharacterWithFilter(
        page: page,
        name: name,
        gender: gender,
        status: status,
      );
      if (result.isSuccess) {
        if (result.successRes != null) {
          data = result.successRes!;
        }
        if (data.results.isNotEmpty) {
          for (int i = 0; i < data.results.length; i++) {
            final singleEpisode = await _ramRepository.getEpisodeByNumber(
              episode:
              data.results[i].episodes[0].toString().split('episode')[1],
            );
            if (singleEpisode.isSuccess) {
              data.results[i].copyWith(
                episode: singleEpisode.successRes,
              );
            }
          }
          characters = [
            ...characters,
            ...data.results,
          ];
          this.page++;
          pages = data.info.pages;
          count = data.info.count;
          emit(RamLoaded(characters: characters));
        } else {
          emit(RamLoaded(characters: characters));
        }
      } else {
        if (result.failRes!.err == "connectTimeout" ||
            result.failRes!.err == "sendTimeout" ||
            result.failRes!.err == "receiveTimeout") {
          emit(RamWithOutConnexion());
        } else {
          emit(RamError());
        }
      }
    } catch (e) {
      emit(RamError());
    }
  }


  void nextPageSearch() {
    if (pages > pageSearch) {
      pageSearch = pageSearch + 1;
    }
  }

  void clearData() {
    pageSearch = 0;
    characters = [];
  }

  void changeFilters({
    String? gender,
    String? status,
  }) {
    sGender = gender ?? sGender;
    sStatus = status ?? sStatus;
  }

  void changeIsFilter(bool v) {
    isFilter = v;
  }

}
