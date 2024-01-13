import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:ggwp/actors/player.dart';
import 'package:ggwp/level/level.dart';

class ActorName {
  static const ninjaForg = 'Ninja Frog';
  static const maskDude = 'Mask Dude';
  static const pinkMan = 'Pink Man';
  static const virtualGuy = 'Virtual Guy';
}

String currentActor = ActorName.ninjaForg;

class GGwp extends FlameGame with HasKeyboardHandlerComponents, DragCallbacks {
  @override
  Color backgroundColor() => const Color(0xFF211F30);

  late final CameraComponent cam;
  late JoystickComponent joystick;

  final level = Level(
    lavelName: 'level-0',
    player: Player(character: currentActor),
  );

  @override
  FutureOr<void> onLoad() async {
    // cache all images
    await images.loadAllImages();

    // camera
    camera = CameraComponent.withFixedResolution(width: 649, height: 360, world: level)
      ..priority = 0
      ..viewfinder.anchor = Anchor.topLeft;

    addGameController();
    addAll([camera, level]);

    return super.onLoad();
  }

  void addGameController() {
    // final screenWidth = size[0];
    // final screenHeight = size[1];

    joystick = JoystickComponent(
      priority: 1,
      knob: SpriteComponent(
        sprite: Sprite(
          images.fromCache('HUD/knob.png'),
          srcSize: Vector2.all(32),
        ),
      ),
      background: SpriteComponent(
        sprite: Sprite(
          images.fromCache('HUD/joystick.png'),
          srcSize: Vector2.all(64),
        ),
      ),
      margin: const EdgeInsets.only(
        left: 32,
        bottom: 32,
      ),

      // position: Vector2(screenWidth - 100, screenHeight),
    );
    // joystick = JoystickComponent(
    //   priority: 1,
    //   knob: CircleComponent(radius: 30, paint: BasicPalette.black.paint()),
    //   background: CircleComponent(radius: 60, paint: BasicPalette.black.withAlpha(100).paint()),
    //   margin: const EdgeInsets.only(bottom: 40, left: 40),
    // );
    add(joystick);
  }
}
