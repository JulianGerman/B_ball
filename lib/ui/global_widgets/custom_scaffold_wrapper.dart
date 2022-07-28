import 'package:flutter/material.dart';
import 'dart:io';

class CustomScaffoldWrapper extends StatelessWidget {
  final Widget child;
  const CustomScaffoldWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: Platform.isIOS ? false : true,
      child: Scaffold(
        // To avoid notch:
        body: Platform.isIOS
            ? Padding(
                padding: const EdgeInsets.only(top: 40),
                child: child,
              )
            : child,
      ),
    );
  }
}
