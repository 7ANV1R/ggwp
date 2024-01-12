import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:ggwp/level/level.dart';

class GGwp extends FlameGame {
  @override
  Color backgroundColor() => const Color(0xFF211F30);

  late final CameraComponent cam;

  final level = Level();

  @override
  FutureOr<void> onLoad() async {
    // cache all images
    await images.loadAllImages();

    // camera
    camera = CameraComponent.withFixedResolution(width: 649, height: 360, world: level);

    camera.viewfinder.anchor = Anchor.topLeft;
    addAll([camera, level]);
    return super.onLoad();
  }
}
