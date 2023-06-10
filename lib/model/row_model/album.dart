import 'package:adn_music_player/model/row_model/artiste.dart';
import 'package:adn_music_player/model/row_model/song.dart';

class Album{
  String title;
  Artist artist;
  List<Song> songs;

  Album({
   required this.title,
   required this.artist,
   required this.songs,
});

}