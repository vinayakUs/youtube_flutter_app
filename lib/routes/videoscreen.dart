import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// ignore: must_be_immutable
class Videoscreen extends StatefulWidget {
  var videodata;
  Videoscreen(this.videodata);
  @override
  _VideoscreenState createState() => _VideoscreenState();
}

class _VideoscreenState extends State<Videoscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: <Widget>[
          YoutubePlayer(
            context: context,
            initialVideoId: widget.videodata.videoid,
            ),
          Text(widget.videodata.videotitle),
        ],
      )),
    );
  }
}
