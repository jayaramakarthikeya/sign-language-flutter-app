import 'package:SignLanguage/services/info_card.dart';
import 'package:SignLanguage/services/personal_info.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  List<PersonalInfo> info = [
    PersonalInfo(
        name: 'Karthikeya',
        info:
            "       Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
        imageUrl: 'assets/karthikeya.png',
        githubUrl: "https://github.com/JayaramKarthik",
        linkedinUrl: "https://linkedin.com/in/karthikeya-jayaram"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Devs'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.blue[900],
      ),
      body: ListView.builder(
          itemCount: info.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: InfoCard(personal: info[index]),
            );
          }),
    );
  }
}
