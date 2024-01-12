import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ggwp/ggwp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setLandscape();
  GGwp game = GGwp();
  runApp(
    GameWidget(
      game: kDebugMode ? GGwp() : game,
    ),
  );
}
