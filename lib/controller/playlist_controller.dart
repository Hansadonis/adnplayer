import 'dart:math';

import 'package:adn_music_player/controller/player_controller.dart';
import 'package:adn_music_player/model/enums/playlist.dart';
import 'package:adn_music_player/model/row_model/song.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaylistController extends StatelessWidget {
  const PlaylistController({
    Key? key,
    required this.playlist,
    required this.title,
    required this.type
  }) : super(key: key);

  final List<Song> playlist;
  final String title;
  final PlayList type;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            topView(MediaQuery.of(context).size),
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index){
                      return ListTile(
                        leading: Image.network(playlist[index].thumb),
                        title: Text(playlist[index].title),
                        trailing: Icon(Icons.arrow_right),
                        onTap: (){
                          final route =  MaterialPageRoute(builder: (context){
                            return MyPlayersController(
                                songToPlay: playlist[index],
                                playlist: playlist,
                                backgroundColor: Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 0.75),
                            );
                          });
                          Navigator.push(context, route);
                        },
                      );
                    },
                    separatorBuilder: ((context, index) => Divider()),
                    itemCount: playlist.length)
            )

          ],
        ),
      ),

    );
  }
  Widget topView(Size size){
    switch(type){
      case PlayList.artist: return Container();
      case PlayList.album:
        return Container(
          child: Column(
            children: [
              Image.network(playlist.first.thumb, height: size.height / 4,),
              Text(playlist.first.album, style: GoogleFonts.signika(fontSize: 25),),
              Text(playlist.first.artist.name, style: GoogleFonts.signika(fontSize: 20, color: Colors.red),),
            ],
          ),
        );
      case PlayList.genre: return Container();
      default: return Container();
    }

  }
}
