import 'package:b_ball/ui/global_widgets/custom_scaffold_wrapper.dart';
import 'package:b_ball/ui/pages/game/game_model/game_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GamePage extends StatelessWidget {
  static const String routeName = '/game';
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: CustomScaffoldWrapper(
        child: Center(
          child: TextButton(
            onPressed: () async =>
                context.read<GameModelCubit>().launchGameScreen(context),
            child: const Text('Game'),
          ),
        ),
      ),
    );
  }
}
