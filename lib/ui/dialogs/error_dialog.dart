import 'dart:developer';
import 'package:b_ball/config/colors.dart';
import 'package:b_ball/constants/texts.dart';
import 'package:b_ball/models/custom_error.dart';
import 'package:flutter/material.dart';

void errorDialog(BuildContext context, CustomError e) {
  log('code: ${e.code}, message ${e.message}');

  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(e.code),
          content: Text(
            '${e.plugin}\n${e.message}',
            style:
                CustomTypography.textStyleH3.copyWith(color: CustomColors.grey),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(Texts.ok),
            )
          ],
        );
      });
}
