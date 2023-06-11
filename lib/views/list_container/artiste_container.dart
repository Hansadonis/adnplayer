import 'package:adn_music_player/model/row_model/artiste.dart';
import 'package:adn_music_player/model/services/music_handler.dart';
import 'package:adn_music_player/views/cells/artist_circle_cells.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArtistContainer extends StatelessWidget {
   ArtistContainer({Key? key}) : super(key: key);

  final List<Artist> artists = MusicHandler().allArtist();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Artistes", style: GoogleFonts.signika(fontSize: 20),),
          Container(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: artists.length,
              itemBuilder: ((context, index) => ArtistCirclecell(artist: artists[index], height: 75)),
            ),
          ),

        ],
      ),
    );
  }

}
