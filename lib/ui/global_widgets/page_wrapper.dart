import 'package:b_ball/config/colors.dart';
import 'package:b_ball/ui/pages/game_page/game_page.dart';
import 'package:b_ball/ui/pages/home_page/home_page.dart';
import 'package:b_ball/ui/pages/profile_page/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class PageWrapper extends StatefulWidget {
  static const String routeName = '/pageWrapper';
  const PageWrapper({Key? key}) : super(key: key);

  @override
  State<PageWrapper> createState() => _PageWrapperState();
}

class _PageWrapperState extends State<PageWrapper>
    with SingleTickerProviderStateMixin {
  late final Animation<double> _gamePadAnimation;
  late final AnimationController _gamePadAnimationController;
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  void initState() {
    super.initState();
    _gamePadAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
      reverseDuration: const Duration(
        milliseconds: 1000,
      ),
    )..forward();

    _gamePadAnimation = Tween<double>(
      begin: 0,
      end: 10,
    ).animate(_gamePadAnimationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _gamePadAnimationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _gamePadAnimationController.forward();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      onWillPop: ((_) async => false),
      screens: _buildScreens(),
      items: _navBarsItems(),
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      confineInSafeArea: false,
      backgroundColor: CustomColors.upperBackGroundColor,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(20.0),
        colorBehindNavBar: CustomColors.upperBackGroundColor,
        border: Border.all(
          color: CustomColors.buttonColor,
        ),
      ),
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style15,
    );
  }

  List<Widget> _buildScreens() {
    return [
      const HomePage(),
      const GamePage(),
      const ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: _buildIcon(CupertinoIcons.home, true),
        inactiveIcon: _buildIcon(CupertinoIcons.home, false),
        activeColorPrimary: CustomColors.white,
        inactiveColorPrimary: CustomColors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: _buildIcon(CupertinoIcons.game_controller, true),
        inactiveIcon: AnimatedBuilder(
          animation: _gamePadAnimation,
          child: const Icon(CupertinoIcons.game_controller),
          builder: (BuildContext context, Widget? child) {
            return Padding(
              padding: EdgeInsets.only(top: _gamePadAnimation.value),
              child: child,
            );
          },
        ),
        activeColorPrimary: CustomColors.buttonColorDarker,
        activeColorSecondary: CustomColors.white,
      ),
      PersistentBottomNavBarItem(
        icon: _buildIcon(CupertinoIcons.person, true),
        inactiveIcon: _buildIcon(CupertinoIcons.person, false),
        activeColorPrimary: CustomColors.white,
        inactiveColorPrimary: CustomColors.grey,
      ),
    ];
  }

  Container _buildIcon(IconData iconName, bool isActive) {
    return Container(
      decoration: isActive
          ? BoxDecoration(
              shape: BoxShape.rectangle,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  blurRadius: 30.0,
                ),
                BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  blurRadius: 30.0,
                ),
              ],
            )
          : null,
      child: Icon(iconName),
    );
  }

  @override
  void dispose() {
    _gamePadAnimationController.dispose();
    super.dispose();
  }
}
