
import 'package:flutter/material.dart';
import 'package:learn_music/views/list_container/artist_container.dart';

class MusicView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Divider(),
          ArtistContainer(),
        ],
      ),
    );
  }
}