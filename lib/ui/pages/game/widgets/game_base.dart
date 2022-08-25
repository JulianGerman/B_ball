import 'dart:async';

import 'package:b_ball/ui/pages/game/components/user_ball_component.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

class GameBase extends FlameGame with HasCollisionDetection, TapDetector {
  final List<String> userAccelerometerValues;
  GameBase({required this.userAccelerometerValues});

  @override
  Color backgroundColor() => Colors.transparent.withOpacity(0.2);
  UserBallComponent userBall = UserBallComponent();

  @override
  Future<void>? onLoad() async {
    await super.onLoad();
    // Inside the game methods:
    const pauseOverlayIdentifier = 'PauseMenu';

    // Marks 'PauseMenu' to be rendered.
    overlays.add(pauseOverlayIdentifier);

    userBall = UserBallComponent()
      ..position = size / 2
      ..anchor = Anchor.center;

    // START GAME:
    add(userBall);
  }

  @override
  void update(double dt) {
    super.update(dt);
    userBall.y += 1;
  }

  @override
  bool onTapDown(TapDownInfo info) {
    print("Player tap down on ${info.eventPosition.game}");
    return true;
  }

  @override
  bool onTapUp(TapUpInfo info) {
    print("Player tap up on ${info.eventPosition.game}");
    return true;
  }
}
