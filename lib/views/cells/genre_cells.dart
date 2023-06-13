import 'dart:math';

import 'package:adn_music_player/model/enums/genre.dart';
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
