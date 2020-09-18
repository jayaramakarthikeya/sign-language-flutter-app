import 'package:flutter/material.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/purple.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 210.0, 0.0, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: 50.0,
                  fontFamily: 'IndieFlower',
                  letterSpacing: 2.0,
                  color: Colors.indigo[900],
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30.0),
              Text(
                'Sign Language Translator App',
                style: TextStyle(
                  letterSpacing: 1.0,
                  fontSize: 20.0,
                  fontFamily: 'Architect',
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 100.0),
              Text(
                'Click below to know about Devs',
                style: TextStyle(
                  letterSpacing: 2.0,
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 40.0),
              Container(
                width: 160.0,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/about');
                  },
                  child: Text(
                    'About',
                    style: TextStyle(
                      letterSpacing: 2.0,
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.indigo[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 140.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.copyright, color: Colors.white),
                  Text(
                    'SignLanguage Translator 2020',
                    style: TextStyle(
                      letterSpacing: 2.0,
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.indigo[900],
          selectedItemBorderColor: Colors.white,
          selectedItemBackgroundColor: Colors.green,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
          unselectedItemLabelColor: Colors.white,
          unselectedItemIconColor: Colors.white,
        ),
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          setState(() {
            selectedIndex = index;
            if (index == 2) {
              Navigator.pushNamed(context, '/about');
              selectedIndex = 0;
            } else if (index == 1) {}
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.home,
            label: 'Home',
          ),
          FFNavigationBarItem(
            iconData: Icons.camera,
            label: 'Camera',
          ),
          FFNavigationBarItem(
            iconData: Icons.book,
            label: 'About',
          ),
        ],
      ),
    );
  }
}
