import 'package:flutter/material.dart';
import 'package:youtube_flutter_app/routes/home.dart';
import 'package:youtube_flutter_app/routes/inbox.dart';
import 'package:youtube_flutter_app/routes/library.dart';
import 'package:youtube_flutter_app/routes/subscription.dart';
import 'trending.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  void selectedIndex(int index) {
    setState(() {
      _selecetedindex = index;
    });
  }

  int _selecetedindex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> screen = [
      Home(),
      Trending(),
      Subscription(),
      Inbox(),
      Library()
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset(
          "images/youtube_logo.png",
          fit: BoxFit.fill,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.cast),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){},
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: selectedIndex,
        currentIndex: _selecetedindex,
        selectedItemColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            title: Text("Home"),
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            title: Text("Trending"),
            icon: Icon(
              Icons.trending_up,
            ),
          ),
          BottomNavigationBarItem(
            title: Text("Subscription"),
            icon: Icon(
              Icons.subscriptions,
            ),
          ),
          BottomNavigationBarItem(
            title: Text("Inbox"),
            icon: Icon(
              Icons.email,
            ),
          ),
          BottomNavigationBarItem(
            title: Text("Library"),
            icon: Icon(
              Icons.folder,
            ),
          ),
        ],
      ),
      body: screen[_selecetedindex],
    );
  }
}
