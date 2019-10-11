import 'package:flutter/material.dart';
import 'package:youtube_flutter_app/widgets/videolist.dart';

class Home extends StatefulWidget {
  final String homeurl =
      "https://www.googleapis.com/youtube/v3/videos?part=snippet&chart=mostPopular&maxResults=30&key=AIzaSyCMLaIzD4LbTY2uhjTzXI5O16zOQ0o1nRQ";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: VideoList(widget.homeurl),
      ),
    );
  }
}
