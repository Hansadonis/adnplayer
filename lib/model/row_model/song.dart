import 'package:adn_music_player/model/row_model/artiste.dart';
import 'package:adn_music_player/model/enums/genre.dart';
import 'package:adn_music_player/model/enums/media_type.dart';

class Song{
  int id;
  String title;
  String album;
  String path;
  String thumb;
  Artist artist;
  Genre genre;
  MediaType mediaType;

  Song({
   required this.id,
   required this.title,
   required this.album,
   required this.path,
   required this.thumb,
   required this.artist,
   required this.genre,
   required this.mediaType
});

}