import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:b_ball/config/colors.dart';
import 'package:b_ball/ui/global_widgets/custom_scaffold_wrapper.dart';
import 'package:b_ball/ui/pages/game/game_model/game_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Game extends StatefulWidget {
  static const String routeName = '/gameModule';
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWrapper(
      child: Center(
        child: BlocBuilder<GameModelCubit, GameModelState>(
            builder: (context, state) {
          if (state.gameModelStatus == GameModelStatus.loading) {
            return _buildLoader();
          }
          return TextButton(
              child: const Text('Back'),
              onPressed: () =>
                  context.read<GameModelCubit>().stopGame(context));
        }),
      ),
    );
  }

  Widget _buildLoader() {
    const Duration fadeInDuration = Duration(milliseconds: 600);
    const double fontSize = 60;
    return AnimatedTextKit(
      animatedTexts: [
        FadeAnimatedText(
          '3',
          duration: fadeInDuration,
          textStyle: CustomTypography.textStyleH1.copyWith(
            fontSize: fontSize,
          ),
        ),
       FadeAnimatedText(
          '2',
          duration: fadeInDuration,
          textStyle: CustomTypography.textStyleH1.copyWith(
            fontSize: fontSize,
          ),
        ),
        FadeAnimatedText(
          '1',
          duration: fadeInDuration,
          textStyle: CustomTypography.textStyleH1.copyWith(
            fontSize: fontSize,
          ),
        ),
      ],
      onFinished: () => context.read<GameModelCubit>().startGame(),
      totalRepeatCount: 1,
      pause: const Duration(milliseconds: 100),
    );
  }
}
