import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/core/entities/episode.dart';
import 'package:rick_and_morty/core/repositories/ram/ram_repository.dart';

part 'episode_state.dart';

class EpisodeCubit extends Cubit<EpisodeState> {
  final RamRepository _ramRepository;

  EpisodeCubit({
    required RamRepository ramRepository,
  })  : _ramRepository = ramRepository,
        super(EpisodeLoading());

  Future getEpisodeForCharacter({required List episodes}) async {
    emit(EpisodeLoading());
    final result = await _ramRepository.getAllEpisodeByNumbers(
      episodes: episodes,
    );
    if (result.isSuccess) {
      emit(EpisodeLoaded(episodeList: result.successRes!));
    } else {
      emit(EpisodeError());
    }
  }
}
