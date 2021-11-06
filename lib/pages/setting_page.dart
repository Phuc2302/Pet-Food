import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.lightBlue,
              child: ListTile(
                onTap: () {},
                title: Text(
                  "Cong Phuc",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/profile.jpg"),
                ),
                trailing: Icon(
                  Icons.edit,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Card(
              elevation: 4.0,
              margin: EdgeInsets.fromLTRB(26.0, 8.0, 26.0, 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.lock_outline,
                      color: Colors.purple,
                    ),
                    title: Text("Change Password"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {},
                  ),
                  _buildDivider(),
                  ListTile(
                    leading: Icon(
                      Icons.translate_outlined,
                      color: Colors.purple,
                    ),
                    title: Text("Change Language"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {},
                  ),
                  _buildDivider(),
                  ListTile(
                    leading: Icon(
                      Icons.location_on,
                      color: Colors.purple,
                    ),
                    title: Text("Change Location"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              "Notification Settings",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            SwitchListTile(
              activeColor: Colors.lightBlue,
              value: true,
              title: Text("Received notification"),
              onChanged: (value) {},
            ),
            SwitchListTile(
              activeColor: Colors.lightBlue,
              value: false,
              title: Text("Received newsletter"),
              onChanged: null,
            ),
            SwitchListTile(
              activeColor: Colors.lightBlue,
              value: true,
              title: Text("Received Offer Notification"),
              onChanged: (value) {},
            ),
            SwitchListTile(
              activeColor: Colors.lightBlue,
              value: true,
              title: Text("Received App Update"),
              onChanged: null,
            ),
          ],
        ),
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }
}
