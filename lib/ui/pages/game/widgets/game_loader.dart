import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:b_ball/config/colors.dart';
import 'package:b_ball/ui/pages/game/game_model/game_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameLoader extends StatelessWidget {
  const GameLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        _buildLoadingText('3'),
        _buildLoadingText('2'),
        _buildLoadingText('1'),
      ],
      onFinished: () => context.read<GameModelCubit>().startGame(),
      totalRepeatCount: 1,
      pause: const Duration(milliseconds: 100),
    );
  }

  FadeAnimatedText _buildLoadingText(String value) {
    const Duration fadeInDuration = Duration(milliseconds: 600);
    const double fontSize = 60;
    return FadeAnimatedText(
      value,
      duration: fadeInDuration,
      textStyle: CustomTypography.textStyleH1.copyWith(
        fontSize: fontSize,
      ),
    );
  }
}
