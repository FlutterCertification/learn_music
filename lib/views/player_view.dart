import 'package:flutter/material.dart';
import 'package:learn_music/models/raw_model/song.dart';

class PlayerView extends StatelessWidget {
  final Song song;
  final EdgeInsets padding = const EdgeInsets.all(8);

  const PlayerView({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(song.title),
      ),
      body: SafeArea(child: Column(
        children: [],
      )),
    );
  }
}