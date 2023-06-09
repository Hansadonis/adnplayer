import 'package:adn_music_player/model/row_model/song.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedHandler{
  final String key = "searchKey";

  Future<bool> removeItemToList(String value) async{
    final instance = await SharedPreferences.getInstance();
    final list = await getList();
    list.remove(value);
    await instance.setStringList(key, list);
    return true;
  }

  Future<bool> addItemToList(String value) async{
    final instance = await SharedPreferences.getInstance();
    final list = await getList();
    list.add(value);
    await instance.setStringList(key, list);
    return true;
  }

  Future<List<String>>getList() async{
    final instance = await SharedPreferences.getInstance();
    final List<String> result = instance.getStringList(key) ?? [];
    return result;

  }
}