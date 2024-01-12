import 'dart:async';

import 'package:flame/components.dart';
import 'package:ggwp/ggwp.dart';

enum PlayerState { idle, running }

class Player extends SpriteAnimationGroupComponent with HasGameRef<GGwp> {
  late final SpriteAnimation idleAnimation;
  late final SpriteAnimation runAnimation;

  final double stepTime = 0.05;

  @override
  FutureOr<void> onLoad() async {
    _loadAllAnimations();
    return super.onLoad();
  }

  void _loadAllAnimations() {
    idleAnimation = SpriteAnimation.fromFrameData(
      game.images.fromCache('Main Characters/Ninja Frog/idle (32x32).png'),
      SpriteAnimationData.sequenced(
        amount: 11,
        stepTime: stepTime,
        textureSize: Vector2.all(32),
      ),
    );
  }
}
