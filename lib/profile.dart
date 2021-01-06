import 'package:divya_shramik/home.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final String uid;
  Profile({@required this.uid});
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        bottomNavigationBar: _bottomNavigationBar(),
        body: SafeArea(
          child: Material(
            child: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  delegate: MySliverAppBar(expandedHeight: 200),
                  pinned: true,
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(
                        height: 100,
                      ),
                      ListTile(
                        title: Text('Name'),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      ListTile(
                        title: Text('Name'),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      ListTile(
                        title: Text('Name'),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      ListTile(
                        title: Text('Name'),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      ListTile(
                        title: Text('Name'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      onWillPop: () async {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(
                      uid: widget.uid,
                    )));
        return false;
      },
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

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({@required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Image.asset(
          'assets/images/headerimage.jpg',
          fit: BoxFit.cover,
        ),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: Text(
              "User Profile",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 23,
              ),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 2 - shrinkOffset,
          //left: MediaQuery.of(context).size.width / 3,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Opacity(
                  opacity: (1 - shrinkOffset / expandedHeight),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(65.0),
                    ),
                    elevation: 10,
                    child: CircleAvatar(
                      radius: 65.0,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
