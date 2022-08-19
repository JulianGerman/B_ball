import 'package:b_ball/ui/global_widgets/custom_scaffold_wrapper.dart';
import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  static const String routeName = '/game';
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: const CustomScaffoldWrapper(
        child: Center(
          child: Text('Game'),
        ),
      ),
    );
  }
}
