import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/Profile/body.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'Profile',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: Body(),
        //  bottomNavigationBar: CustomBottomNavBar(SelectedMenu: MenuState.profile),
      );
}
