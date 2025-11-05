import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_music/models/enums/genre.dart';
import 'package:learn_music/models/sevices/music_handler.dart';
import 'package:learn_music/views/cells/genre_cell.dart';

class GenreContainer extends StatelessWidget {
  List<Genre> genres = MusicHadler().allGenres();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text("Genres musicaux", style: GoogleFonts.signika(fontSize: 20),),
          Container(
            height: 75,
            child: ListView.builder(
                itemBuilder: ((c, i) => GenreCell(genre: genres[i])),
              itemCount: genres.length,
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}