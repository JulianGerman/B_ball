import 'package:b_ball/config/colors.dart';
import 'package:b_ball/ui/global_widgets/custom_scaffold_wrapper.dart';
import 'package:b_ball/ui/pages/game/game_model/game_model_cubit.dart';
import 'package:b_ball/ui/pages/game/widgets/game_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            return const GameLoader();
          }
          return _buildContent();
        }),
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      padding: EdgeInsets.all(8.h),
      child: Column(
        children: [
          SizedBox(height: 10.h),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: CustomColors.bottomBackGroundColor,
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
          TextButton(
            child: const Text('Back'),
            onPressed: () => context.read<GameModelCubit>().stopGame(context),
          ),
        ],
      ),
    );
  }
}
