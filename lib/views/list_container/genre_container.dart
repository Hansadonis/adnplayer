import 'package:adn_music_player/model/enums/genre.dart';
import 'package:adn_music_player/model/services/music_handler.dart';
import 'package:adn_music_player/views/cells/genre_cells.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenreContainer extends StatelessWidget {
  GenreContainer({Key? key}) : super(key: key);
  List<Genre> genres = MusicHandler().allGenre();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Genres musicaus", style: GoogleFonts.signika(fontSize: 20),),
          Container(
            height: 75,
              child: ListView.builder(
                  itemCount: genres.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) => GenreCell(genre: genres[index])),
              )
          )
        ],
      ),
    );
  }
}
