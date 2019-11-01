import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:youtube_flutter_app/model/dataclass.dart';
import 'package:youtube_flutter_app/routes/errorsreen.dart';
import 'package:youtube_flutter_app/routes/videoscreen.dart';
import 'package:youtube_flutter_app/utils/networkhelper.dart';

Future<List<VideoData>> getvideolist(String url) async {
  var r = await NetworkingHelper(url).getDecodeddata();
  List<VideoData> videoList = [];
  var parsed = r["items"];

  for (var o in parsed) {
    videoList.add(VideoData.fromJson(o));
  }
  return videoList;
}



class VideoList extends StatefulWidget {
  @override
  _VideoListState createState() => _VideoListState();
  //Getting All parameters
  VideoList(this.url);
  final String url;
}

class _VideoListState extends State<VideoList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getvideolist(widget.url),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData &&
            !snapshot.hasError) {
          return ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  Image.network(
                    snapshot.data[index].thumbnailimage,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 35,
                        child: Image.asset(
                          "images/man.png",
                        ),
                        margin: EdgeInsets.all(8),
                      ),
                      Expanded(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Videoscreen(snapshot.data[index])));
                          },
                          contentPadding: EdgeInsets.fromLTRB(5, 5, 1, 0),
                          title: Text(
                            snapshot.data[index].videotitle,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            softWrap: true,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.connectionState == ConnectionState.active) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          var e = snapshot.error;
          return Errorscreen(e.toString());
        }
        return null;
      },
    );
  }
}
