import 'package:adn_music_player/views/list_container/artiste_container.dart';
import 'package:flutter/material.dart';

class MusicView extends StatelessWidget {
  const MusicView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Divider(),
          ArtistContainer(),

        ],
      ),
    );
  }
}
