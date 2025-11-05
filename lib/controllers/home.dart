import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_music/models/raw_model/bar_choice.dart';
import 'package:learn_music/views/music_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home> {
  int currindex = 0;
  List<BarChoice> items = [
    BarChoice(label: "Music", iconData: Icons.music_note, page: MusicView()),
    BarChoice(label: "Favoris", iconData: Icons.whatshot, page: Container()),
    BarChoice(label: "Recherche", iconData: Icons.search, page: Container()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: SafeArea(child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Spacer(),
                    Icon(Icons.radio),
                    Icon(Icons.doorbell),
                    Icon(Icons.settings)
                  ],
                ),
                items[currindex].tittleForAppBar
              ],
            ),
          ))),
      body: items[currindex].page,
      bottomNavigationBar: BottomNavigationBar(
          items: items.map((i) => i.item).toList(),
        currentIndex: currindex,
        onTap: barTapped,
      ),
    );
  }

  barTapped(int ind) {
    currindex = ind;
  }
}