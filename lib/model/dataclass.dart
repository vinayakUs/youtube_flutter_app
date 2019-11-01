
class VideoData {
  var videotitle, videoid;
  var thumbnailimage;
  var date;
  var playurl;
  VideoData(
      {this.thumbnailimage,
      this.date,
      this.playurl,
      this.videoid,
      this.videotitle});
  set url(String id) {
    playurl = id;
  }

  VideoData.fromJson(Map<String, dynamic> json)
      : videotitle = json['snippet']["title"],
        videoid = json['id'],
        thumbnailimage = json['snippet']["thumbnails"]["medium"]["url"],
        date = json['snippet']["publishedAt"];
}
