import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/Welcome/components/body1.dart';
import 'package:flutter_catalog/pages/Welcome/components/custom_bottom_nav_bar.dart';


class Profile extends StatelessWidget {
  @override
  Widget build (BuildContext context) => Scaffold(
       appBar: AppBar(
         title: Text('Profile'),
         centerTitle: true,
         backgroundColor: Colors.red,
       ),
       body: Body1(),
       bottomNavigationBar: CustomBottomNavBar(SelectedMenu: MenuState.profile),
  );

}

