import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/Welcome/components/body.dart';
// import 'package:flutter_catalog/pages/Welcome/components/custom_bottom_nav_bar.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      // bottomNavigationBar: CustomBottomNavBar(SelectedMenu: MenuState.home,),
    );
  }
}
