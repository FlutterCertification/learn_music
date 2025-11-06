import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:learn_music/models/enums/mediaType.dart';
import 'package:learn_music/models/raw_model/song.dart';
import 'package:learn_music/views/player_view.dart';

class MyPlayerController extends StatefulWidget {
  final Song songToPlay;
  final List<Song> playlist;
  const MyPlayerController({super.key, required this.songToPlay, required this.playlist});

  @override
  State<StatefulWidget> createState() {
    return MyPlayerControllerState();
  }
}

class MyPlayerControllerState extends State<MyPlayerController> {
  late Song song;
  late AudioPlayer audioPlayer;
  AudioCache ? audioCache;

  Duration position = const Duration(seconds: 0);
  Duration maxDuration = const Duration(seconds: 0);


  @override
  void initState() {
    super.initState();
    song = widget.songToPlay;
    setupPlayer();
  }

  @override
  void dispose() {
    clearPlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PlayerView(song: song,
    onReapeatpressed: onReapeatPress,
    onShufflePressed: onShufflePressed,
    onForwardPressed: onForwardPressed,
    onPlayPausePressed: onPlayPausePressed,
    onRewindPressed: onRewindPressed,
    onPositionChanged: onPositionChanged,
    position: position,
    maxDuration: maxDuration,
  );

  onReapeatPress () {}
  onShufflePressed () {}
  onPlayPausePressed () {}
  onRewindPressed() {}
  onForwardPressed() {}
  onPositionChanged(double newPos) {}


  Future<String> pathForInApp () async {
    return "";
  }
  setupPlayer() async {
    audioPlayer = AudioPlayer();

    Source source;
    if (song.mediaType == MediaType.internet) {
      source = UrlSource(song.path);
    } else {
      final localPath = await pathForInApp();
      source = DeviceFileSource(localPath);
    }

    await audioPlayer.play(source);
  }
  clearPlayer() {
    audioPlayer.stop();
    audioPlayer.dispose();
    if (audioCache != null) audioCache?.clearAll();
    audioCache = null;
  }
}