import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

  final imageUrl =
      "https://thaolejp.ap-south-1.linodeobjects.com/assets/images/avatar_default.png";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
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
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                // color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                // style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                // color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                // style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                // color: Colors.white,
              ),
              title: Text(
                "Email",
                textScaleFactor: 1.2,
                // style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
