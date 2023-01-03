import 'package:flutter/material.dart';
import 'package:pokemon/app_widget.dart';
import 'package:pokemon/locator.dart';

void main() {
  registerDependencies();
  runApp(const PokemonApp());
}
