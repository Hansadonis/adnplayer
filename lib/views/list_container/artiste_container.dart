import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArtistContainer extends StatelessWidget {
  const ArtistContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Artistes", style: GoogleFonts.signika(fontSize: 20),),

        ],
      ),
    );
  }
}
