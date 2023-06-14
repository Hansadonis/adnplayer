import 'package:adn_music_player/model/row_model/song.dart';
import 'package:adn_music_player/views/player_view.dart';
import 'package:flutter/material.dart';

class MyPlayersController extends StatefulWidget {
  MyPlayersController({required this.songToPlay, required this.playlist});
  final Song songToPlay;
  List<Song> playlist;
  @override
  State<MyPlayersController> createState() => _MyPlayersControllerState();
}

class _MyPlayersControllerState extends State<MyPlayersController> {
  late Song song;
  final Duration position = const Duration(seconds: 0);
  final Duration maxDuration = const Duration(seconds: 0);


  @override
  void initState() {
    super.initState();
    song = widget.songToPlay;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      PlayerView(
        song: song,
        onRepeadPressed: onRepeatPressed,
        onShufflePressed: onShufflePressed,
        onPlayPausePressed: onPlayPausePressed,
        onRewindPressed: onRewindPressed,
        onForwardPresed: onForwardPressed,
        onPositionChanged: onPositionChange,
        position: position,
        maxDuration: maxDuration,
      );

  onPositionChange(double newPosition){

  }

  onPlayPausePressed(){

  }

  onRewindPressed(){

  }

  onForwardPressed(){

  }

  onRepeatPressed(){

  }

  onShufflePressed(){

  }
}
