import 'dart:async';

import 'package:b_ball/ui/pages/game/components/user_ball_component.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sensors_plus/sensors_plus.dart';

class GameBase extends FlameGame with HasCollisionDetection, TapDetector {
  List<double> _userGyroscopeValues = [];
  UserBallComponent userBall = UserBallComponent();

  @override
  Color backgroundColor() => Colors.transparent.withOpacity(0.2);

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
    gyroscopeEvents.listen((GyroscopeEvent event) {
      _userGyroscopeValues = <double>[event.x, event.y, event.z];
    });
    // START GAME:
    add(userBall);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (_userGyroscopeValues.isNotEmpty) {
      userBall.y += _userGyroscopeValues[0] * 10.h;
      userBall.x += _userGyroscopeValues[1] * 5.w;
    }
  }
}
