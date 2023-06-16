import 'dart:math';

import 'package:adn_music_player/model/enums/media_type.dart';
import 'package:adn_music_player/model/row_model/song.dart';
import 'package:adn_music_player/views/player_view.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MyPlayersController extends StatefulWidget {
  MyPlayersController({required this.songToPlay, required this.playlist, required this.backgroundColor});
  final Song songToPlay;
  List<Song> playlist;
  final Color backgroundColor;
  @override
  State<MyPlayersController> createState() => _MyPlayersControllerState();
}

class _MyPlayersControllerState extends State<MyPlayersController> {
  late Song song;
  late AudioPlayer audioPlayer;
  AudioCache? audioCache;

   Duration position = const Duration(seconds: 0);
   Duration maxDuration = const Duration(seconds: 0);
  bool playShuffle = false;
  bool repead = false;
  IconData iconData = Icons.play_circle;


  @override
  void initState() {
    super.initState();
    song = widget.songToPlay;
    seetupPlayer();
  }

  @override
  void dispose() {
    clearplayer();
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
        repead: repead,
        shuffle: playShuffle,
        playPauseIcon: iconData,
        backgrounColor: widget.backgroundColor,
      );

  onPositionChange(double newPosition){
    final newDuration = Duration(seconds: newPosition.toInt());
    audioPlayer.seek(newDuration);
  }

  onPlayPausePressed() async{
    final state = audioPlayer.state;
    switch(state){
      case PlayerState.stopped:
        seetupPlayer();
        break;
      case PlayerState.playing:
        await audioPlayer.pause();
        break;
      case PlayerState.completed:
        (repead) ? audioPlayer.seek(Duration(seconds: 0)) : onForwardPressed();
        print("music finichh");
        break;
      case PlayerState.paused:
        await audioPlayer.resume();
        break;
      default:
        break;
    }
  }

  onRewindPressed(){
    final newSong = (playShuffle) ? randomSong() : previousSong();
    song = newSong;
    clearplayer();
    seetupPlayer();
  }

  onForwardPressed(){
    final newSong = (playShuffle) ? randomSong() : nextSong();
    song = newSong;
    clearplayer();
    seetupPlayer();
  }

  onRepeatPressed(){
    setState(() {
      repead = !repead;
    });
  }

  onShufflePressed(){
    setState(() {
      playShuffle = !playShuffle;
    });
  }

  Future<String>pathForInApp() async{
    String string = "";
    audioCache = AudioCache();
    if(audioCache != null){
      final uri = await audioCache!.load(song.path);
      string = uri.toString();
      return string;
    }else{
      return string;
    }


  }

  onStateChange(PlayerState state){
    setState(() {
      switch(state){
        case PlayerState.stopped:
          iconData = Icons.play_circle;
          break;
        case PlayerState.playing:
          iconData = Icons.pause_circle;
          break;
        case PlayerState.completed:
          break;
        case PlayerState.paused:
          iconData = Icons.play_circle;
          break;
        default:
          break;
      }
    });
  }

  onDurationChange(Duration duration){
    setState(() {
      maxDuration = duration;
    });
  }

  onAudioPositionChanged(Duration newPosition){
    setState(() {
      position = newPosition;
    });
  }

  seetupPlayer() async{
    audioPlayer = AudioPlayer();
    audioPlayer.onPlayerStateChanged.listen(onStateChange);
    audioPlayer.onDurationChanged.listen(onDurationChange);
    audioPlayer.onPositionChanged.listen(onAudioPositionChanged);
    final url = (song.mediaType == MediaType.internet) ? song.path : await pathForInApp();
    await audioPlayer.play(UrlSource(url));
  }

  clearplayer(){
    audioPlayer.stop();
    audioPlayer.dispose();
    if(audioCache != null) audioCache?.clearAll();
    audioCache = null;
  }

  Song previousSong(){
    final index = widget.playlist.indexWhere((song) => song.title == this.song.title);
    final newIndex = (index == 0) ? widget.playlist.length - 1 : index - 1;
    return widget.playlist[newIndex];
  }

  Song nextSong(){
    final index = widget.playlist.indexWhere((song) => song.title == this.song.title);
    final int newIndex = (index < widget.playlist.length - 1) ? index + 1 : 0;
    return widget.playlist[newIndex];
  }

  Song randomSong(){
    final index = Random().nextInt(widget.playlist.length);
    final newSong = widget.playlist[index];
    return newSong;
  }
}
