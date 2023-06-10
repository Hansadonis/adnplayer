import 'package:adn_music_player/model/row_model/bar_choice.dart';
import 'package:adn_music_player/views/music_view.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  List<Barchoice> items = [
    Barchoice(label: "Musique", iconData: Icons.music_note, page: MusicView()),
    Barchoice(label: "Favoris", iconData: Icons.whatshot, page: Container()),
    Barchoice(label: "Musique", iconData: Icons.search, page: Container()),

  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Spacer(),
                    Icon(Icons.radio),
                    Icon(Icons.doorbell),
                    Icon(Icons.settings),
                  ],
                ),
                items[currentIndex].titleForApp,
              ],
            ),
          ),

        ),
      ),
      body: items[currentIndex].page,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          items: items.map((i) => i.item).toList(),
          onTap: barTapped,
      ),
    );

  }
  barTapped(int index){
    setState(() {
      currentIndex = index;
    });
  }
}
