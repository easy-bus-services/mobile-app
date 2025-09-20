import 'package:shared_preferences/shared_preferences.dart';
import 'package:super_admin/core/enums/cache_enum.dart';

class CacheService {

  Future<void> setValue(String key,dynamic value, CacheEnums valueType) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (valueType) {
      case CacheEnums.bool:
           await prefs.setBool(key,value);
            break;
      case CacheEnums.int:
            await prefs.setInt(key,value);
            break;
      case CacheEnums.string:
           await prefs.setString(key,value);
            break;
      case CacheEnums.double:
            await prefs.setDouble(key,value);
            break;
      case CacheEnums.list:
            await prefs.setStringList(key,value);
            break;
    }
  }

  Future<bool> getBoolValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }
  
  Future<int> getIntValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? 0;
  }  

  Future<String> getStringValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }  

  Future<double> getDoubleValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key) ?? 0;
  }

  Future<List<String>> getStringListValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key) ?? List.empty();
  }

  Future<void> clearByKey(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key); // Clears all stored data
  }

  Future<void> clearAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clears all stored data
  }
}