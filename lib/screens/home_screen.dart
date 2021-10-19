import 'package:flutter/material.dart';

import 'package:hw_3/data/data.dart';

import 'package:hw_3/widgets/app_bar.dart';
import 'package:hw_3/widgets/video_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSliverAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 60.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final video = homeScreenVideos[index];
                  return VideoCard(video: video);
                },
                childCount: homeScreenVideos.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
