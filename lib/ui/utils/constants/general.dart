import 'constants.dart';

managerColor(String color) {
  switch (color) {
    case "alive":
      return kGreen;
    case "dead":
      return kBlack100;
    case "unknown":
      return kOrange;
    default:
      return kBlack100;
  }
}

allEpisode(List episode) {
  List allEpisode = [];
  for (var i = 0; i < episode.length; i++) {
    String mock = episode[i].toString().split("episode/")[1];
    allEpisode.add(mock);
  }
  return allEpisode;
}