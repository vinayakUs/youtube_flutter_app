import 'package:flutter/material.dart';
import 'package:youtube_flutter_app/routes/errorsreen.dart';
import 'package:youtube_flutter_app/utils/networkhelper.dart';

class VideoList extends StatefulWidget {
  @override
  _VideoListState createState() => _VideoListState();
  //Getting All parameters
  VideoList(this.url);
  final String url;
}

class _VideoListState extends State<VideoList> {
  Widget a = Container();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NetworkingHelper(widget.url).getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData &&
            !snapshot.hasError) {
          return ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data["items"].length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.network(
                    snapshot.data["items"][index]["snippet"]["thumbnails"]
                        ["high"]["url"],
                    width: double.infinity,
                    height: 230,
                    fit: BoxFit.fitWidth,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Center(
                            child: Container(
                              child: CircleAvatar(),
                              padding: EdgeInsets.all(8),
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 8, left: 8),
                              child: Text(
                                snapshot.data["items"][index]["snippet"]
                                    ["title"],
                                style: TextStyle(fontSize: 18),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                      ),
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
      },
    );
  }
}
