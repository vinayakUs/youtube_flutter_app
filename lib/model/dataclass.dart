import 'package:flutter/cupertino.dart';

class VideoData {
  String title, url;
  Image thumbnailimage;
  Image circularavator;
  var views;
  String date;
  String channelname;
  VideoData(
      {this.title,
      this.url,
      this.thumbnailimage,
      this.circularavator,
      this.views,
      this.date,
      this.channelname});
}
