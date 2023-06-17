import 'package:adn_music_player/model/enums/genre.dart';
import 'package:adn_music_player/model/row_model/album.dart';
import 'package:adn_music_player/model/row_model/artiste.dart';
import 'package:adn_music_player/model/services/music_datas.dart';
import 'package:adn_music_player/model/row_model/song.dart';

class MusicHandler{
  final datas = MusicDatas();
  List<Artist> allArtist(){
    List<Artist> artists = [];
    final all = datas.allDatas();
    for(var song in all){
      if(!artists.contains(song.artist)){
        artists.add(song.artist);
      }
    }
    return artists;
  }

  List<Album> allAlbum(){
    List<Album> albums = [];
    final all = datas.allDatas();
    for(var song in all){
      final singer = song.artist.name;
      final albumTitle = song.album;
      Album newAlbum = albums.firstWhere((album) => (album.artist.name == singer && album.title == albumTitle),
      orElse: () => Album(artist: song.artist, title: song.album, songs: [song])
      );
      if(!newAlbum.songs.contains(song)) newAlbum.songs.add(song);
      if(!albums.contains(newAlbum)) albums.add(newAlbum);
    }

    return albums;
  }

  List<Genre> allGenre(){
    List<Genre> genres=[];
    final all = datas.allDatas();
    for (var song in all) {
      if(!genres.contains(song.genre)) genres.add(song.genre);
    }return genres;
  }

  List<Song> allMusicFromArtist(Artist artist){
    List<Song> playlist = [];
    final all = datas.allDatas();
    for(var song in all){
      if(song.artist.name == artist.name){
        playlist.add(song);
      }
    }
    return playlist;
  }

  List<Song> allMusicFromGenre(Genre genre){
    List<Song> playlist = [];
    final all = datas.allDatas();
    for(var song in all){
      if(song.genre == genre){
        playlist.add(song);
      }
    }
    return playlist;
  }

  List<Song> research(String string){
      final lowercase = string.toLowerCase();
      final all = datas.allDatas();
      List<Song> result = [];
      for(var song in all){
        final artist = song.artist.name.toLowerCase();
        final album = song.album.toLowerCase();
        final title = song.title.toLowerCase();
        if(
          artist.contains(lowercase) ||
          album.contains(lowercase) ||
          title.contains(lowercase)
        ){
          result.add(song);
        }
      }
      return result;
  }

}