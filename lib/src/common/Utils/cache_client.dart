import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveClient {
  String _boxName = '';

  Future<void> initialize(String boxName) async {
    await Hive.initFlutter();
    _boxName = boxName;
    await Hive.openBox(_boxName);
  }

  Box getBox() {
    if (!Hive.isBoxOpen(_boxName)) {
      return Hive.box(_boxName);
    } else {
      return Hive.box(_boxName);
    }
  }

  Future<void> closeBox() async {
    if (Hive.isBoxOpen(_boxName)) {
      await Hive.box(_boxName).close();
    }
  }

  void addItem(dynamic item) async {
    final box = await getBox();
    await box.add(item);
    await box.close();
  }

  dynamic getItem(String key) async {
    final box = getBox();
    final item = box.get(key);
    await box.close();
    return item;
  }

  List<dynamic> getItems() {
    final box = getBox();
    final items = box.values.toList();
    return items;
  }

  void deleteItem(int index) async {
    final box = await getBox();
    await box.deleteAt(index);
    await box.close();
  }
}
