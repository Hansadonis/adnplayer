import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class Barchoice{
  String label;
  IconData iconData;
  Widget page;

  Icon get icon => Icon(iconData);

  BottomNavigationBarItem get item => BottomNavigationBarItem(icon: icon, label: label);
  Text get titleForApp => Text(label, style: GoogleFonts.signika(fontSize: 30),);

  Barchoice({
    required this.label,
    required this.iconData,
    required this.page
});

}