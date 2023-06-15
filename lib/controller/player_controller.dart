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

  final Duration position = const Duration(seconds: 0);
  final Duration maxDuration = const Duration(seconds: 0);
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
        onForwardPressed();
        break;
      case PlayerState.paused:
        await audioPlayer.resume();
        break;
      default:
        break;
    }
  }

  onRewindPressed(){

  }

  onForwardPressed(){

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

  seetupPlayer() async{
    audioPlayer = AudioPlayer();
    audioPlayer.onPlayerStateChanged.listen(onStateChange);
    final url = (song.mediaType == MediaType.internet) ? song.path : await pathForInApp();
    await audioPlayer.play(UrlSource(url));
  }

  clearplayer(){
    audioPlayer.stop();
    audioPlayer.dispose();
    if(audioCache != null) audioCache?.clearAll();
    audioCache = null;
  }
}
