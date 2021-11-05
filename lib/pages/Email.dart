import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/drawer.dart';


class Email extends StatelessWidget {
  final controllerTo = TextEditingController();
  final controllerSubject = TextEditingController();
  // ignore: non_constant_identifier_names
  final ControllerMessage = TextEditingController();

  String get title => null;


  @override
  Widget build (BuildContext context) => Scaffold(
       drawer: MyDrawer(), 
       appBar: AppBar(
         title: Text('Email'),
         centerTitle: true,
         backgroundColor: Colors.green,
       ),
       body: SingleChildScrollView(
         padding: EdgeInsets.all(16),
         child: Column(
           children: [
             biuldTextField(Title: 'To', controller: controllerTo),
             const SizedBox(height: 16),
             biuldTextField(Title: 'Subject', controller: controllerSubject),
             const SizedBox(height: 16),
             biuldTextField(
               Title: 'Message',
               controller: ControllerMessage,
               maxLines: 8,
             ),
             const SizedBox(height: 32),
             ElevatedButton(
               style: ElevatedButton.styleFrom(
                 minimumSize: Size.fromHeight(50),
                 textStyle: TextStyle(fontSize: 20),
               ),
               child: Text('SEND'),
               onPressed: () => launchEmail(
                 toEmail: controllerTo.text,
                 subject: controllerSubject.text,
                 message: ControllerMessage.text,
               ),
             )
           ],
         ),
       ),
  );

  biuldTextField({
    String Title, 
    TextEditingController controller, 
    int maxLines = 1,
    }) => 
        Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: controller,
              maxLines: maxLines,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),       
            ),
          ],
        );

  launchEmail({
    String toEmail, 
    String subject, 
    String message,
    }) async {
      final url = 'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(message)}';

      if (await canLaunch(url)) {
        await launch(url);
      }
    }

  canLaunch(String url) {}

  launch(String url) {}


  
}