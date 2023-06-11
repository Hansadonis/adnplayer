import 'package:adn_music_player/model/row_model/artiste.dart';
import 'package:flutter/material.dart';

class ArtistCirclecell extends StatelessWidget {
  const ArtistCirclecell({Key? key, required this.artist, required this.height}) : super(key: key);

  final Artist artist;
  final double height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
          padding: EdgeInsets.all(0),
        child: ClipOval(
          child: Image.network(artist.urlImage, fit: BoxFit.cover, height: height, width: height,),
        ),

      ),
    );
  }

  onTap(){

  }
}
