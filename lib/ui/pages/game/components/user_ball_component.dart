import 'package:b_ball/config/colors.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sensors_plus/sensors_plus.dart';

class UserBallComponent extends PositionComponent with CollisionCallbacks {
  late ShapeHitbox hitbox;
  UserBallComponent(Vector2 position)
      : super(
          position: position,
          size: Vector2.all(40),
          anchor: Anchor.center,
        );
  List<double> _userGyroscopeValues = [];

  @override
  Future<void>? onLoad() async {
    gyroscopeEvents.listen((GyroscopeEvent event) {
      _userGyroscopeValues = <double>[event.x, event.y, event.z];
    });

    final defaultPaint = Paint()..color = CustomColors.buttonColor;
    hitbox = CircleHitbox()
      ..paint = defaultPaint
      ..renderShape = true;
    add(hitbox);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (_userGyroscopeValues.isNotEmpty) {
      //TODO: Add boundaries!
      position.y += _userGyroscopeValues[0] * 10.h;
      position.x += _userGyroscopeValues[1] * 5.w;
    }
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);

    if (other is ScreenHitbox) {
      hitbox.paint.color = Colors.red;
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    super.onCollisionEnd(other);

    hitbox.paint.color = CustomColors.buttonColor;
  }
}
