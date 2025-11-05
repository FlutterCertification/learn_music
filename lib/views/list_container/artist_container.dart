import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_music/models/raw_model/artist.dart';
import 'package:learn_music/models/sevices/music_handler.dart';
import 'package:learn_music/views/cells/artist_circle_cell.dart';

class ArtistContainer extends StatelessWidget {

  final List<Artist> artists = MusicHadler().allArtist();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text("Artistes",
          style: GoogleFonts.signika(fontSize: 20)),
          Container(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemBuilder: ((c, i) => ArtistCircleCell(artist: artists[i], height: 75)),
              itemCount: artists.length,
            ),
          )
        ],
      ),
    );
  }
}