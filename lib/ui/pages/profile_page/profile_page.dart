import 'package:b_ball/ui/global_widgets/custom_scaffold_wrapper.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = '/profile';
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: CustomScaffoldWrapper(
        child: Center(
          child: Text('Profile'),
        ),
      ),
    );
  }
}
