import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:ggwp/actors/player.dart';
import 'package:ggwp/level/level.dart';

class ActorName {
  static const ninjaForg = 'Ninja Frog';
  static const maskDude = 'Mask Dude';
  static const pinkMan = 'Pink Man';
  static const virtualGuy = 'Virtual Guy';
}

String currentActor = ActorName.ninjaForg;

class GGwp extends FlameGame with HasKeyboardHandlerComponents {
  @override
  Color backgroundColor() => const Color(0xFF211F30);

  late final CameraComponent cam;

  final level = Level(
    lavelName: 'level-0',
    player: Player(character: currentActor),
  );

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
