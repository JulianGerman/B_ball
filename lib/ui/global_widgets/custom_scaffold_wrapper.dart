import 'dart:io';

import 'package:b_ball/config/colors.dart';
import 'package:flutter/material.dart';

class CustomScaffoldWrapper extends StatelessWidget {
  final Widget child;
  final bool automaticallyImplyLeading;
  const CustomScaffoldWrapper({
    Key? key,
    required this.child,
    this.automaticallyImplyLeading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.upperBackGroundColor,
      child: SafeArea(
        top: Platform.isIOS ? false : true,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: automaticallyImplyLeading,
          ),
          // To avoid notch:
          body: Platform.isIOS
              ? Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: child,
                )
              : child,
        ),
      ),
    );
  }
}
