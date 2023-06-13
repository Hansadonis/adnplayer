import 'package:adn_music_player/model/row_model/song.dart';
import 'package:flutter/material.dart';

class PlayerView extends StatelessWidget {
  const PlayerView({Key? key, required this.song}) : super(key: key);
  final Song song;
  final EdgeInsets padding = const EdgeInsets.all(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(song.title),
      ),
      body: SafeArea(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
