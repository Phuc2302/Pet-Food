import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/profile/profile.dart';
import 'package:flutter_catalog/pages/Welcome/welcome_screen.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/pages/setting_page.dart';

class MyDrawer extends StatelessWidget {
  var text;

  final imageUrl =
      "https://thaolejp.ap-south-1.linodeobjects.com/assets/images/avatar_default.png";

  get onClicked => null;

  @override
  Widget build(BuildContext context) {
    // var hoverColor;
    return Drawer(
      child: Material(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Cong Phuc"),
                accountEmail: Text("congphucqs@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            const SizedBox(height: 30),
            buildMenuItem(
              text: 'Home',
              icon: Icons.home,
              onClicked: () => selectedItem(context, 0),
            ),
            const SizedBox(height: 30),
            buildMenuItem(
              text: 'Profile',
              icon: Icons.people,
              onClicked: () => selectedItem(context, 1),
            ),
            const SizedBox(height: 30),
            buildMenuItem(
              text: 'Setting',
              icon: Icons.settings,
              onClicked: () => selectedItem(context, 2),
            ),
            const SizedBox(height: 48),
            buildMenuItem(
              text: "Log out",
              icon: Icons.logout_outlined,
              onClicked: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WelcomeScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  selectedItem(BuildContext context, int i) {
    Navigator.of(context).pop();

    switch (i) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Profile(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SettingPage(),
        ));
        break;
    }
  }

  // ignore: non_constant_identifier_names
  Widget buildMenuItem({
    String text,
    IconData icon,
    Function() onClicked,
  }) {
    final color = Colors.black;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color, size: 26),
      title: Text(text, style: TextStyle(color: color, fontSize: 16)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
}
