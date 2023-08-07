import 'dart:async';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveClient {
  String _boxName = '';

  Future<void> initialize(String boxName) async {
 
    _boxName = boxName;
    await Hive.openBox<String>(_boxName);
  }

  Box<String> getBox() {
   // if (Hive.isBoxOpen(_boxName)) {
      return Hive.box(_boxName);
   // } else {
   //   return await Hive.openBox(_boxName);
   // }
  }

  Future<void> closeBox() async {
    if (Hive.isBoxOpen(_boxName)) {
      await Hive.box<String>(_boxName).close();
    }
  }

  void addItem(String item) async {
    final box = await getBox();
    await box.put(_boxName, item);
 //   await box.close();
  }

  dynamic getItem(String key)  {
    final box =  getBox() ; 
    final item =  box.get(key) ;
   // await box.close();
    return item;
  }

  Future<List<dynamic>> getItems() async {
    final box = await getBox();
    final items = box.values.toList();
    return items;
  }

  void deleteItem(int index) async {
    final box = await getBox();
    await box.deleteAt(index);
   // await box.close();
  }

  void clearBox()async{
    final box =  getBox();
    await box.clear();
  }
}
