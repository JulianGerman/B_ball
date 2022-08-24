import 'package:b_ball/config/colors.dart';
import 'package:b_ball/constants/texts.dart';
import 'package:b_ball/global_blocs/game_bloc/game_bloc.dart';
import 'package:b_ball/ui/global_widgets/custom_gradient_card.dart';
import 'package:b_ball/ui/global_widgets/custom_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LastGames extends StatelessWidget {
  const LastGames({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: Column(
        children: [
          Row(
            children: const [
              Text(
                Texts.lastGames,
                style: CustomTypography.textStyleH3,
              ),
            ],
          ),
          SizedBox(height: 20.h),
          _buildListOfGames(),
        ],
      ),
    );
  }

  BlocBuilder _buildListOfGames() {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        List<int> games = state.games;
        if (state.gameStatus == GamesStatus.loading) {
          return const CustomIndicator();
        }
        if (games.isEmpty) return const Text('Empty');
        return MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: games.length,
            itemBuilder: ((context, index) {
              return CustomGradientCard(
                height: 150.h,
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Text(
                          '05:23',
                          style: CustomTypography.textStyleH3,
                        ),
                      ],
                    ),
                    //BALL MODEL!
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          '15/11/2022',
                          style: CustomTypography.textStyleH5,
                        ),
                        SizedBox(width: 20.w),
                        const Text(
                          '66 XP Points',
                          style: CustomTypography.textStyleH5,
                        ),
                      ],
                    )
                  ],
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
