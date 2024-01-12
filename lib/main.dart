import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ggwp/ggwp.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setLandscape();
  GGwp game = GGwp();
  runApp(
    GameWidget(
      game: kDebugMode ? GGwp() : game,
    ),
  );
}
