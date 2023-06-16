import 'package:adn_music_player/controller/playlist_controller.dart';
import 'package:adn_music_player/model/enums/playlist.dart';
import 'package:adn_music_player/model/row_model/artiste.dart';
import 'package:adn_music_player/model/services/music_handler.dart';
import 'package:flutter/material.dart';

class ArtistCirclecell extends StatelessWidget {
  const ArtistCirclecell({Key? key, required this.artist, required this.height}) : super(key: key);

  final Artist artist;
  final double height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        final playlist = MusicHandler().allMusicFromArtist(artist);
        final route = MaterialPageRoute(builder: (context) => PlaylistController(
            playlist: playlist,
            title: artist.name,
            type: PlayList.artist,
        ));
        Navigator.push(context, route);
      },
      child: Padding(
          padding: EdgeInsets.all(0),
        child: ClipOval(
          child: Image.network(artist.urlImage, fit: BoxFit.cover, height: height, width: height,),
        ),

      ),
    );
  }

}
