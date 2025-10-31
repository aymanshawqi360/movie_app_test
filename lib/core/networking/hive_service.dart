import 'package:hive_ce_flutter/adapters.dart';

import 'package:movie_app_test/core/util/text_manager.dart';
import 'package:movie_app_test/features/home/doman/entities/movie_entity.dart';

class HiveService {
  HiveService._();

  static Box<MovieEntity>? _box;

  static Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(MovieEntityAdapter());
    _box = await Hive.openBox<MovieEntity>(TextManager.boxData);
  }

  static Future<void> addToHive(List<MovieEntity> data) async {
    if (_box == null) return;
    // await _box!.clear();
    await _box!.addAll(data);
  }

  static List<MovieEntity> saveData() {
    if (_box == null) return [];
    return _box!.values.toList();
  }
}
