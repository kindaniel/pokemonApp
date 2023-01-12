import 'package:flutter/material.dart';
import 'package:pokemon/app_widget.dart';
import 'package:pokemon/locator.dart';
import 'package:pokemon/settings/hive_settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveSettings.startHive();
  registerDependencies();
  runApp(const PokemonApp());
}
