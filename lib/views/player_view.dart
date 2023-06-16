import 'dart:math';

import 'package:adn_music_player/model/row_model/song.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayerView extends StatelessWidget {
  PlayerView({
    Key? key,
    required this.song,
    required this.onRepeadPressed,
    required this.onShufflePressed,
    required this.onPlayPausePressed,
    required this.onRewindPressed,
    required this.onForwardPresed,
    required this.maxDuration,
    required this.position,
    required this.onPositionChanged,
    required this.shuffle,
    required this.repead,
    required this.playPauseIcon,
    required this.backgrounColor
  }) : super(key: key);

  final Song song;
  final EdgeInsets padding = const EdgeInsets.all(8);
  final Duration maxDuration;
  final Duration position;
  final bool shuffle;
  final bool repead;

  final Function() onRepeadPressed;
  final Function() onShufflePressed;
  final Function() onPlayPausePressed;
  final Function() onRewindPressed;
  final Function() onForwardPresed;
  final Function(double) onPositionChanged;
  final IconData playPauseIcon;
  final Color backgrounColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgrounColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(song.title),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              child: Image.network(
                  song.thumb,
                  fit: BoxFit.fill,
                width: size.width / 2,
              ),
            ),
            const Divider(thickness: 3,),
            Row(      // this one is for design
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.ios_share),
                rowSpace(16),
                const Icon(Icons.menu),
                rowSpace(16),
                const Icon(Icons.whatshot)
              ],
            ),
            Text(song.artist.name, style: GoogleFonts.signika(color: Colors.redAccent, fontSize: 35)),
            Text(song.title, style: GoogleFonts.signika(fontSize: 20, fontWeight: FontWeight.bold)),
            Card(
              child: Container(
                color: backgrounColor.withOpacity(0.75),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        IconButton(
                            onPressed: onRepeadPressed,
                            icon: Icon((repead) ? Icons.repeat_on_rounded : Icons.repeat),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(padding: padding, child: IconButton(icon: Icon(Icons.fast_rewind), onPressed: onRewindPressed,),),
                            Padding(padding: padding, child: IconButton(icon: Icon(playPauseIcon), onPressed: onPlayPausePressed,),),
                            Padding(padding: padding, child: IconButton(icon: Icon(Icons.fast_forward), onPressed: onForwardPresed,),),
                          ],
                        ),

                        IconButton(onPressed: onShufflePressed, icon: Icon((shuffle) ? Icons.shuffle_on_rounded :Icons.shuffle))

                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(redeableDuration(Duration(seconds: 0)), style: GoogleFonts.signika(fontSize: 18, color: Colors.red),),
                            Text(redeableDuration(position), style: GoogleFonts.signika(fontSize: 18, color: Colors.red),),
                            Text(redeableDuration(maxDuration), style: GoogleFonts.signika(fontSize: 18, color: Colors.red),),
                          ],
                        ),
                        Slider(
                            min: 0,
                            max: maxDuration.inSeconds.toDouble(),
                            value: position.inSeconds.toDouble(),
                            onChanged: onPositionChanged,
                            thumbColor: Colors.red,
                            activeColor: Colors.red,
                          inactiveColor: Colors.white,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.speaker),
                Icon(Icons.timer),
                Icon(Icons.whatshot_outlined),
              ],
            )

          ],
        ),
      ),
    );
  }
  SizedBox rowSpace(int value){
    return SizedBox(width: value.toDouble(),);
  }

  String redeableDuration(Duration duration){
    int minutes = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);
    String minutesStr = (minutes < 10) ? "0$minutes" : minutes.toString();
    String secondsStr = (seconds < 10) ? "0$seconds" : seconds.toString();
    return minutesStr + ":" + secondsStr;
  }
}
