import 'package:adn_music_player/model/row_model/album.dart';
import 'package:adn_music_player/model/services/music_handler.dart';
import 'package:adn_music_player/views/cells/album_view_cells.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class Albumscontainer extends StatelessWidget {

  List<Album> albums = MusicHandler().allAlbum();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text("Albums", style: GoogleFonts.signika(fontSize: 20),),
          Container(
            height: 410,
            child: GridView.builder(
              itemCount: albums.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
                itemBuilder: ((context, index) => AlbumViewCell(album: albums[index])),
          )
          )
        ],
      )
    );
  }
}
