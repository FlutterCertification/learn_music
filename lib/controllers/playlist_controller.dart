import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_music/controllers/player_controller.dart';
import 'package:learn_music/models/enums/playlist.dart';
import 'package:learn_music/models/raw_model/song.dart';

class PlaylistController extends StatelessWidget {
  final List<Song> playlist;
  final String title;
  final Playlist type;

  const PlaylistController({super.key, required this.title, required this.type, required this.playlist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(title),
      ),
      body: SafeArea(child: Column(
        children: [
          topView(MediaQuery.of(context).size),
          Expanded(child: ListView.separated(
              itemBuilder: (c, i)  {
                return ListTile(
                  leading: Image.network(playlist[i].thumb),
                  title: Text(playlist[i].title),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    final route = MaterialPageRoute(builder: ((c)=> MyPlayerController(
                      songToPlay: playlist[i],
                      playlist: playlist,
                    )));
                    Navigator.push(context, route);
                  },
                );
              },
              separatorBuilder: ((c, i) => const Divider()),
              itemCount: playlist.length))
        ],
      ),
      ),
    );
  }

  Widget topView(Size size) {
    switch (type) {
      case Playlist.artist: return Container();
      case Playlist.album:
        return Container(child: Column(
          children: [
            Text(playlist.first.artist.name, style: GoogleFonts.signika(fontSize: 16, color: Colors.redAccent),),
            Image.network(playlist.first.thumb, height: size.height / 4,),
            Text(playlist.first.album, style: GoogleFonts.signika(fontSize: 20)),
          ],
        ),
        );
      case Playlist.genre: return Container();
      default: return Container();
    }
  }
}