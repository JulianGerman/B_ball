import 'package:b_ball/config/colors.dart';
import 'package:b_ball/constants/texts.dart';
import 'package:b_ball/core/auth_bloc/auth_bloc.dart';
import 'package:b_ball/global_blocs/game_bloc/game_bloc.dart';
import 'package:b_ball/models/user.dart';
import 'package:b_ball/ui/global_widgets/custom_indicator.dart';
import 'package:b_ball/ui/global_widgets/custom_scaffold_wrapper.dart';
import 'package:b_ball/ui/pages/profile_page/user_cubit/user_cubit.dart';
import 'package:b_ball/ui/pages/profile_page/widgets/last_games.dart';
import 'package:b_ball/ui/pages/profile_page/widgets/profile_info.dart';
import 'package:b_ball/ui/pages/profile_page/widgets/recent_balls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/profile';
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    _getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: CustomScaffoldWrapper(
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state.userStoreStatus == UserStoreStatus.success) {
              return _buildMainContent(state.user);
            }
            return const CustomIndicator();
          },
        ),
      ),
    );
  }

  SingleChildScrollView _buildMainContent(User user) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20.h),
          const Text(
            Texts.myProfile,
            style: CustomTypography.textStyleH2,
          ),
          SizedBox(height: 20.h),
          ProfileInfo(user: user),
          SizedBox(height: 40.h),
          const RecentBalls(),
          SizedBox(height: 40.h),
          const LastGames(),
          _buildSignOutButton(),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  Row _buildSignOutButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () =>
              BlocProvider.of<AuthBloc>(context).add(SignOutRequestedEvent()),
          child: Text(
            Texts.signOut,
            style: CustomTypography.textStyleH5
                .copyWith(decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }

  Future<void> _getProfile() async {
    final String uid = context.read<AuthBloc>().state.user!.uid;
    await context.read<UserCubit>().getProfile(uid: uid);
    context.read<GameBloc>().add(FetchGamesEvent());
  }
}
