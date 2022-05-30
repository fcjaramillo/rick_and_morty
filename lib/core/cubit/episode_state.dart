part of 'episode_cubit.dart';

abstract class EpisodeState extends Equatable {
  const EpisodeState();

  @override
  List<Object> get props => [];
}

class EpisodeLoading extends EpisodeState {}

class EpisodeLoaded extends EpisodeState {
    const EpisodeLoaded({required this.episodeList});
  final List<Episode> episodeList;

  @override
  List<Object> get props => [episodeList];
}

class EpisodeError extends EpisodeState {}
