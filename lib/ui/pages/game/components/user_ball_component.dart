import 'dart:developer';

import 'package:b_ball/config/colors.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';

class UserBallComponent extends PositionComponent with CollisionCallbacks {
  static final _paint = Paint()..color = CustomColors.buttonColor;
  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawCircle(Offset.zero, 20, _paint);
  }
}
