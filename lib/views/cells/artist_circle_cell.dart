import 'package:flutter/material.dart';
import 'package:learn_music/models/raw_model/artist.dart';

class ArtistCircleCell extends StatelessWidget {
  final Artist artist;
  final double height;

  const ArtistCircleCell({super.key, required this.artist, required this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(padding: const EdgeInsets.all(5),
      child: ClipOval(
        child: Image.network(artist.urlImage, width: height, height: height,fit: BoxFit.cover,),
      ),
      ),
    );
  }

  onTap (){}
}