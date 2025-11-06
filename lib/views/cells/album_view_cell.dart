import 'package:flutter/material.dart';
import 'package:learn_music/controllers/playlist_controller.dart';
import 'package:learn_music/models/enums/playlist.dart';
import 'package:learn_music/models/raw_model/album.dart';

class AlbumViewCell extends StatelessWidget {

  final Album album;

  const AlbumViewCell({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return PlaylistController(
            title: album.title,
            type: Playlist.album,
            playlist: album.songs,
          );
        }));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(album.songs[0].thumb, fit: BoxFit.fill,),
      ),
    );
  }
}