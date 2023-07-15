import 'package:wakaluxe/src/common/Utils/cache_client.dart';
import 'package:wakaluxe/src/dependencies_container.dart';
import 'package:wakaluxe/src/features/auth/domain/entities/user_entity.dart';

class LocalUSerData {
  final HiveClient _cacheClient = locator<HiveClient>();

  LocalUSerData() {
    _cacheClient.initialize('user');
  }

  void saveUser(String user) {
    _cacheClient.addItem(user);
  }

  UserEntity? getUser() {
    final data = _cacheClient.getItem('user') as String?;
    if (data == null) return null;
    final user = UserEntity.fromJson(data);
    return user;
  }

  void deleteUser() {
    _cacheClient.deleteItem(0);
  }

  void close() {
    _cacheClient.closeBox();
  }
}
