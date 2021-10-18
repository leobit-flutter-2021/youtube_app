import 'package:flutter/material.dart';

import 'package:hw_3/data/video_detail_data.dart';
import 'package:hw_3/data/colors.dart';
import 'package:hw_3/widgets/util.dart';

class RecommendationsSection extends StatelessWidget {
  const RecommendationsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainComponentsGrey,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            for (var recommendationsPosition = 0;
                recommendationsPosition < recommendations.length;
                recommendationsPosition++) ...{
              VideoRecommendation(recommendations[recommendationsPosition]),
            },
          ],
        ),
      ),
    );
  }
}

class VideoRecommendation extends StatelessWidget {
  final Video videoData;

  const VideoRecommendation(this.videoData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        VideoMiniature(path: videoData.miniatureImagePath),
        Container(
          height: 70,
          color: mainComponentsGrey,
          child: Row(
            children: [
              VideoRecommendationDescription(videoData),
              Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.more_vert_rounded,
                    color: accentLightGrey,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class VideoRecommendationDescription extends StatelessWidget {
  final Video videoData;

  const VideoRecommendationDescription(this.videoData, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(videoData.channel.logoImagePath),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(100.0),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      videoData.title,
                      style: const TextStyle(
                        color: accentLightGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Text(
                    videoData.channel.name +
                        ' • ' +
                        formatNumber(videoData.views) +
                        ' views • ' +
                        videoData.timeAgo,
                    style: const TextStyle(color: textLightGrey, fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
