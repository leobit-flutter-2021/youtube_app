import 'package:flutter/material.dart';
import 'package:hw_3/globalStateManagement/userImageManagement.dart';
import 'package:provider/src/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:hw_3/data/data.dart';

import 'package:hw_3/screens/video_detail_screen.dart';

import 'package:hw_3/widgets/util.dart';

class VideoCard extends StatefulWidget {
  final Video video;

  const VideoCard({Key? key, required this.video}) : super(key: key);

  @override
  _VideoCardState createState() =>
      _VideoCardState(views: this.video.viewsCounter);
}

class _VideoCardState extends State<VideoCard> {
  int views;

  _VideoCardState({required this.views});

  void _incrementViews() {
    setState(() {
      views += 1000;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VideoDetailPage(),
                  ),
                );
              },
              child: Image.network(
                widget.video.miniatureImagePath,
                height: 220.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 8.0,
              right: 8.0,
              child: Container(
                padding: const EdgeInsets.all(4.0),
                color: Colors.black,
                child: Text(
                  widget.video.duration,
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => print('Navigate to profile'),
                child: Builder(builder: (context) {
                  return CircleAvatar(
                    foregroundImage: NetworkImage(
                        context.watch<ImageManagement>().randomImage),
                  );
                }),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        widget.video.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 15.0),
                      ),
                    ),
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          _incrementViews();
                          },
                        child: Text(
                          '${widget.video.channel.name} • '
                          '${formatNumber(views)} • '
                          '${timeago.format(widget.video.timestamp)}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontSize: 14.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Icon(Icons.more_vert, size: 20.0),
              ),
            ],
          ),
        )
      ],
    );
  }
}
