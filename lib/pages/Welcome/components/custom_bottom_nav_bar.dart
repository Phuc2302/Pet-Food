import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key key, 
    @required this.SelectedMenu,
  }) : super(key: key);

  final MenuState SelectedMenu;

  get kPrimaryColor => null;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
         ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/shop.svg",
                color: MenuState.home == SelectedMenu
                     ? kPrimaryColor
                     : inActiveIconColor,
              ),
            onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset("assets/icons/heart.svg",
              color: MenuState.favourite == SelectedMenu
                     ? kPrimaryColor
                     : inActiveIconColor,),
            onPressed: () => Navigator.pushNamed(context, HomeScreen.routeName),
            ),
            IconButton(
              icon: SvgPicture.asset("assets/icons/twitch.svg",
              color: MenuState.message == SelectedMenu
                     ? kPrimaryColor
                     : inActiveIconColor,),
            onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset("assets/icons/shop.svg",
              color: MenuState.profile == SelectedMenu
                     ? kPrimaryColor
                     : inActiveIconColor,),
            onPressed: () => Navigator.pushNamed(context, ProfileScreen.routeName),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen {
  static String routeName;
}

class HomeScreen {
  static String routeName;
}

class MenuState {
  static var profile;

  static var home;

  static var message;

  static var favourite;
}