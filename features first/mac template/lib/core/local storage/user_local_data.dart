import 'dart:convert';
import 'package:get_it/get_it.dart';

import 'table_constant.dart';
import 'local_storage_servcie.dart';

final getIt = GetIt.I;

class UserLocalStorage {
  LocalStorageService storageService = getIt<LocalStorageService>();

  Future<void> storeUser(Map<String, dynamic>? userData) async {
    await storageService.storeItem(
      key: DbTable.userData,
      value: jsonEncode(userData),
    );
  }

  // Future<UserModel?> getUser() async {
  //   final data = await storageService.readItem(DbTable.userTableName);
  //   if (data == null || data == "null") {
  //     return null;
  //   } else {
  //     UserModel userResponse = UserModel.fromJson(jsonDecode(data));
  //     return userResponse;
  //   }
  // }

  Future<void> storeToken(String? token) async {
    storageService.storeItem(
      key: DbTable.token,
      value: jsonEncode(token),
    );
  }

  Future<String?> getToken() async {
    final data = await storageService.readItem(DbTable.token);
    if (data == null || data == "null") {
      return null;
    } else {
      return data;
    }
  }

  logout() async {
    await storageService.deleteAllItems();
  }
}
