import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_music/models/raw_model/album.dart';
import 'package:learn_music/models/sevices/music_handler.dart';
import 'package:learn_music/views/cells/album_view_cell.dart';

class AlbumsContainer extends StatelessWidget {

  List<Album> albums = MusicHadler().allAlbums();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Albums",style: GoogleFonts.signika(fontSize: 20),),
          Container(
            height: 300,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 9, crossAxisSpacing: 10),
                itemBuilder: ((c, i) => AlbumViewCell(album: albums[i])),
            itemCount: albums.length,),
          ),
        ],
      ),
    );
  }
}