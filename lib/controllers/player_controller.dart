import 'package:flutter/material.dart';
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


  @override
  void initState() {
    super.initState();
    song = widget.songToPlay;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PlayerView(song: song);
}