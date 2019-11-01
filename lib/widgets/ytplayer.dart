//import 'package:video_player/video_player.dart';
//import 'package:flutter/material.dart';
//
//class Ytplayer extends StatefulWidget {
//  final String id;
//  var playurl;
//  Ytplayer(this.id,this.playurl);
//  @override
//  _YtplayerState createState() => _YtplayerState();
//}
//
//class _YtplayerState extends State<Ytplayer> {
//  VideoPlayerController _controller;
//
//  @override
//  void initState() {
//    super.initState();
//    _controller = VideoPlayerController.network(
//        widget.playurl)
//      ..initialize().then((_) {
//        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//        setState(() {});
//      });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Stack(
//      children: <Widget>[
//        Center(
//          child: _controller.value.initialized
//              ? AspectRatio(
//                  aspectRatio: _controller.value.aspectRatio,
//                  child: VideoPlayer(_controller),
//                )
//              : Container(),
//        ),
//        FloatingActionButton(
//          onPressed: () {
//            setState(() {
//              _controller.value.isPlaying
//                  ? _controller.pause()
//                  : _controller.play();
//            });
//          },
//          child: _controller.value.isPlaying
//              ? Icon(Icons.pause)
//              : Icon(Icons.play_arrow),
//          backgroundColor: Colors.white70,
//        ),
//      ],
//    );
//  }
//
//  @override
//  void dispose() {
//    super.dispose();
//    _controller.dispose();
//  }
//}
