import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pokemon/settings/app_constants.dart';

class HiveSettings {
  static startHive() async {
    Directory dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    await Hive.openBox(AppConstants.ratingHiveBoxName);
  }
}
