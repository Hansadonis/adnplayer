import 'package:adn_music_player/controller/playlist_controller.dart';
import 'package:adn_music_player/model/enums/playlist.dart';
import 'package:adn_music_player/model/row_model/album.dart';
import 'package:flutter/material.dart';

class AlbumViewCell extends StatelessWidget {
  const AlbumViewCell({Key? key, required this.album}) : super(key: key);
  final Album album;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        final route = MaterialPageRoute(builder: (context){
          return PlaylistController(
              playlist: album.songs,
              title: album.title,
              type: PlayList.album,
          );
        });
        Navigator.push(context, route);

      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(album.songs[0].thumb, fit: BoxFit.fill,),
      ),
    );
  }
}
