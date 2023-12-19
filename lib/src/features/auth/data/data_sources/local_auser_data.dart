import 'dart:convert';

import 'package:wakaluxe/src/common/Utils/cache_client.dart';
import 'package:wakaluxe/src/common/Utils/logger.dart';
import 'package:wakaluxe/src/dependencies_container.dart';
import 'package:wakaluxe/src/features/auth/domain/entities/user_entity.dart';

class LocalUSerData {
  LocalUSerData();
  final HiveClient _cacheClient = locator<HiveClient>();

  Future<void> initialize() async {
    await _cacheClient.initialize('user');
  }

  void saveUser(String user) {
    _cacheClient.addItem(user);
  }

  UserEntity? getUser() {
    final data = _cacheClient.getItem('user');
    logInfo('get data: $data');
    if (data == null) return null;
    final serializeData = json.decode(data as String);
    logInfo('get serializeData: $serializeData');
    final user = UserEntity.fromJson(serializeData as String);
    return user;
  }

  Future<void> deleteUser() async {
    await _cacheClient.clearBox();
  }

  void close() {
    _cacheClient.closeBox();
  }
}
