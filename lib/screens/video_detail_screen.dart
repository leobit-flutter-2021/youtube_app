import 'package:flutter/material.dart';

import 'package:hw_3/data/colors.dart';

import 'package:hw_3/widgets/util.dart';
import 'package:hw_3/widgets/video_description.dart';
import 'package:hw_3/widgets/action_buttons_bar.dart';
import 'package:hw_3/widgets/subscription_bar.dart';
import 'package:hw_3/widgets/comments_section.dart';
import 'package:hw_3/widgets/recommendations_section.dart';

class VideoDetailPage extends StatelessWidget {
  const VideoDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgLightGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              const VideoDescription(),
              ActionButtonsBar(),
              const HorizontalSeparator(height: 1),
              const SubscriptionBar(),
              const HorizontalSeparator(height: 1),
              const CommentsSection(),
              const HorizontalSeparator(height: 20),
              const RecommendationsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
