import 'package:learn_music/models/raw_model/artist.dart';
import 'package:learn_music/models/sevices/music_datas.dart';

class MusicHadler {
  final datas = MusicDatas();
  List<Artist> allArtist() {
    List<Artist> artists = [];
    final all = datas.allDatas();
    for (var song in all) {
      if (!artists.contains(song.artist)) {
        artists.add(song.artist);
      }
    }
    return artists;
  }
}