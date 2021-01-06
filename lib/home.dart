import 'package:divya_shramik/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String uid;
  HomePage({this.uid});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentTabIndex = 1;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff05B7C1),
        title: Text(
          'HOME',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          FlatButton(
            child: Row(
              children: [
                Icon(Icons.person),
                Text(
                  'Log Out',
                  style: TextStyle(fontFamily: 'Lora'),
                ),
              ],
            ),
            textColor: Colors.white,
            onPressed: () {
              FirebaseAuth.instance
                  .signOut()
                  .then((result) =>
                      Navigator.pushReplacementNamed(context, "/login"))
                  .catchError((err) => print(err));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          FlatButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Profile(
                              uid: widget.uid,
                            )));
              },
              child: Text('Profile'))
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: Color(0xff62FFFF),
      unselectedItemColor: Colors.white,
      backgroundColor: Colors.grey[850],
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          title: Text("profile"),
        ),
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("home")),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text("nuh"),
        )
      ],
      onTap: _onTap,
      currentIndex: _currentTabIndex,
    );
  }

  _onTap(int tabIndex) {
    switch (tabIndex) {
      case 0:
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Profile(
                      uid: widget.uid,
                    )));
        break;
      case 1:
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(
                      uid: widget.uid,
                    )));
        break;
      case 2:
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(
                      uid: widget.uid,
                    )));
        break;
    }
    setState(() {
      _currentTabIndex = tabIndex;
    });
  }
}
