import 'package:b_ball/config/colors.dart';
import 'package:b_ball/constants/texts.dart';
import 'package:b_ball/core/auth_bloc/auth_bloc.dart';
import 'package:b_ball/models/user.dart';
import 'package:b_ball/ui/global_widgets/custom_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInfo extends StatelessWidget {
  final User user;
  const ProfileInfo({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fb_auth.User authUser = context.read<AuthBloc>().state.user!;
    return Column(
      children: [
        //TODO: Add possibility to edit profilePhoto
        CachedNetworkImage(
          imageUrl: authUser.photoURL != null
              ? authUser.photoURL!
              : user.profileImage,
          imageBuilder: (context, imageProvider) {
            return Container(
              width: 120.w,
              height: 120.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            );
          },
          placeholder: (_, __) => const CustomIndicator(),
          errorWidget: (_, __, ___) => const Icon(Icons.error),
        ),
        SizedBox(height: 20.h),
        Text(
          user.name,
          style: CustomTypography.textStyleH3,
        ),
        SizedBox(height: 20.h),
        _buildRankRow(),
      ],
    );
  }

  Row _buildRankRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLabel(
          title: Texts.rank,
          data: user.rank,
        ),
        _buildLabel(
          title: Texts.level,
          data: user.level.toString(),
          isMain: true,
        ),
        _buildLabel(
          title: Texts.xpPoints,
          data: user.xpPoints.toString(),
        ),
      ],
    );
  }

  Padding _buildLabel({
    required String title,
    required String data,
    bool isMain = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: SizedBox(
        width: 100.w,
        child: Column(
          children: [
            Text(
              title,
              style: CustomTypography.textStyleH4.copyWith(
                color: CustomColors.buttonColor,
              ),
            ),
            Text(
              data,
              style: CustomTypography.textStyleH4,
            ),
          ],
        ),
      ),
    );
  }
}
