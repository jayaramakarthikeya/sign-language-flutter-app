import 'package:SignLanguage/services/personal_info.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoCard extends StatelessWidget {
  PersonalInfo personal;

  InfoCard({this.personal});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(personal.imageUrl),
                  radius: 50.0,
                ),
                SizedBox(width: 20.0),
                Text(
                  personal.name,
                  style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Balsamiq'),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              personal.info,
              style: TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 1.0,
                  fontStyle: FontStyle.normal),
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  color: Colors.blue,
                  onPressed: () async {
                    String url = personal.githubUrl;
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'could not launch $url';
                    }
                  },
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/github.png'),
                        radius: 10.0,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        'GITHUB',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.0),
                RaisedButton(
                  color: Colors.blue,
                  onPressed: () async {
                    String url = personal.linkedinUrl;
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'could not launch $url';
                    }
                  },
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/linkedin.jpg'),
                        radius: 10.0,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        'LINKEDIN',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
