import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_music/models/raw_model/song.dart';

class PlayerView extends StatelessWidget {
  final Song song;
  final EdgeInsets padding = const EdgeInsets.all(8);
  final Container spacer = Container(width: 16,);
  final Color bg = Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);

  final Function() onReapeatpressed;
  final Function() onShufflePressed;
  final Function() onPlayPausePressed;
  final Function() onRewindPressed;
  final Function() onForwardPressed;
  final Function(double) onPositionChanged;


  final Duration maxDuration;
  final Duration position;



  PlayerView({super.key,
    required this.song,
    required this.onReapeatpressed,
    required this.onShufflePressed,
    required this.onForwardPressed,
    required this.onPlayPausePressed,
    required this.onRewindPressed,
    required this.position,
    required this.maxDuration,
    required this.onPositionChanged,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(song.title),
      ),
      body: SafeArea(child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            child: Image.network(song.thumb,
            fit: BoxFit.fill,
            height: size.height / 3,),
          ),
          const Divider(thickness: 3,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.ios_share),
              spacer,
              const Icon(Icons.menu),
              spacer,
              const Icon(Icons.whatshot),
            ],
          ),
          Text(song.artist.name, style: GoogleFonts.signika(color: Colors.redAccent, fontSize: 25),),
          Text(song.title, style: GoogleFonts.signika(fontSize: 20, fontWeight: FontWeight.bold)),
          Card(
            child: Container(
              color: bg.withOpacity(0.75),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(onPressed: onReapeatpressed, icon: const Icon(Icons.repeat)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(padding: padding, child: IconButton(icon: Icon(Icons.fast_rewind), onPressed: onRewindPressed),),
                          Padding(padding: padding, child: IconButton(icon: Icon(Icons.play_circle), onPressed: onRewindPressed),),
                          Padding(padding: padding, child: IconButton(icon: Icon(Icons.fast_forward), onPressed: onRewindPressed),),
                        ],
                      ),
                      IconButton(onPressed: onShufflePressed, icon: Icon(Icons.shuffle))
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(0.toString(),style: GoogleFonts.signika(fontSize: 18, color: Colors.red),),
                          Text(position.inSeconds.toString(),style: GoogleFonts.signika(fontSize: 18, color: Colors.red),),
                          Text(maxDuration.inSeconds.toString(),style: GoogleFonts.signika(fontSize: 18, color: Colors.red),),
                        ],
                      ),
                      Slider(
                        min: 0,
                          max: maxDuration.inSeconds.toDouble(),
                          value: position.inSeconds.toDouble(),
                          onChanged: onPositionChanged,
                        thumbColor: Colors.red,
                        activeColor: Colors.red,
                        inactiveColor: Colors.white,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.speaker),
              Icon(Icons.timer),
              Icon(Icons.whatshot)
            ],
          )
        ],
      )),
    );
  }
}