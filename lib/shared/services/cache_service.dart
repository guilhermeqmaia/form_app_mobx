import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  SharedPreferences? _sharedPreferences;

  CacheService();

  Future<String?> getString({required String key}) async {
    _sharedPreferences ??= await SharedPreferences.getInstance();

    final result = _sharedPreferences!.getString(key);

    return result;
  }

  Future<bool> setValue({required String key, required dynamic value}) async {
    _sharedPreferences ??= await SharedPreferences.getInstance();

    final result = await _sharedPreferences!.setString(key, value);

    return result;
  }
}
