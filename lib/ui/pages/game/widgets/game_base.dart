import 'dart:async';
import 'package:b_ball/ui/pages/game/components/user_ball_component.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class GameBase extends FlameGame with HasCollisionDetection {
  @override
  Color backgroundColor() => Colors.transparent.withOpacity(0.2);

  @override
  Future<void>? onLoad() async {
    // Add colision
    add(ScreenHitbox());
    UserBallComponent userBall = UserBallComponent(size / 2);

    await super.onLoad();
    // Inside the game methods:
    const pauseOverlayIdentifier = 'PauseMenu';

    // Marks 'PauseMenu' to be rendered.
    overlays.add(pauseOverlayIdentifier);

    // START GAME:
    add(userBall);
  }
}
