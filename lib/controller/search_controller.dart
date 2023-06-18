import 'package:adn_music_player/model/row_model/song.dart';
import 'package:adn_music_player/model/services/music_handler.dart';
import 'package:adn_music_player/model/services/shared_handler.dart';
import 'package:adn_music_player/views/cells/classic_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchController extends StatefulWidget {
  const SearchController({Key? key}) : super(key: key);

  @override
  State<SearchController> createState() => _SearchControllerState();
}

class _SearchControllerState extends State<SearchController> {

  List<String> lastSearchedSong = [];
  List<Song> searchResult = [];

  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    getSharePref();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                        controller: textEditingController,
                        onChanged: search,
                        onSubmitted: save,
                        decoration: InputDecoration(
                          hintText: "entrer un text"
                        ),
                      ),
                  ),
                  IconButton(
                      onPressed: onPressed,
                      icon: Icon(Icons.send),
                  )
                ],
              ),
            ),
            Text((textEditingController.text == "")
            ? "derniere recherche"
            : "nous avons trouve pour vous",
              style: GoogleFonts.signika(color: Colors.red, fontSize: 20),
            ),
            Expanded(
                child: ((textEditingController.text == "")
                ? emptyWidget()
                : onSearhWidget()
                ),
            )
          ],
        ),
    );
  }

  Widget emptyWidget(){
    return ListView.separated(
        itemBuilder: (context, index){
          final String value = lastSearchedSong[index];
          return ListTile(
            title: Text(value),
            onTap: (() => onTap(value)),
            onLongPress: (() => remove(value)),
          );
        },
        separatorBuilder: ((context, index) => Divider()),
        itemCount: lastSearchedSong.length);
  }

  Widget onSearhWidget(){
    return ListView.separated
      (itemBuilder: ((context, index) => ClassicTile(playlist: searchResult, index: index)),
        separatorBuilder: ((context, index) => const Divider()),
        itemCount: searchResult.length
    );
  }

  closeKeyboard() => FocusScope.of(context).requestFocus(FocusNode());

  onPressed(){
    closeKeyboard();
    if(textEditingController.text != "") save(textEditingController.text);
  }

  search(String string){
    final result = MusicHandler().research(string);
    setState(() {
      searchResult = result;
    });
  }

  save(String value){
    SharedHandler().addItemToList(value).then((value) => getSharePref());
  }

  getSharePref(){
    SharedHandler().getList().then((newList) => {
      setState((){
        lastSearchedSong = newList;
      })
    });
  }

  onTap(String value){
    textEditingController.text = value;
    search(value);
  }
  
  remove(String value){
    SharedHandler().removeItemToList(value).then((success) => {
      getSharePref(),
    });
  }

}
