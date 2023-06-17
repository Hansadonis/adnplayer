import 'dart:math';

import 'package:adn_music_player/controller/player_controller.dart';
import 'package:adn_music_player/model/row_model/song.dart';
import 'package:flutter/material.dart';

class ClassicTile extends StatelessWidget {
  const ClassicTile({Key? key, required this.playlist, required this.index}) : super(key: key);

  final List<Song> playlist;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(playlist[index].thumb),
      title: Text(playlist[index].title),
      trailing: Icon(Icons.arrow_right),
      onTap: (){
        final route =  MaterialPageRoute(builder: (context){
          return MyPlayersController(
            songToPlay: playlist[index],
            playlist: playlist,
            backgroundColor: Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 0.75),
          );
        });
        Navigator.push(context, route);
      },
    );
  }
}
