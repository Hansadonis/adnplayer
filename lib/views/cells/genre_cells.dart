import 'dart:math';

import 'package:adn_music_player/controller/playlist_controller.dart';
import 'package:adn_music_player/model/enums/genre.dart';
import 'package:adn_music_player/model/enums/playlist.dart';
import 'package:adn_music_player/model/services/music_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenreCell extends StatelessWidget {
  const GenreCell({Key? key, required this.genre}) : super(key: key);
  final Genre genre;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        final list = MusicHandler().allMusicFromGenre(genre);
        final route = MaterialPageRoute(builder: (builder) {
          return PlaylistController(
              playlist: list,
              title: genre.name,
              type: PlayList.genre,
          ) ;
        });
        Navigator.push(context, route);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color.fromARGB(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1),
        ),
        child: Center(
          child: Text(genre.name, style: GoogleFonts.signika(fontSize: 20, color: Colors.white)),
        ),
      ),
    );
  }
}
