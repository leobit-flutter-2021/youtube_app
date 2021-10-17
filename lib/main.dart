import 'package:flutter/material.dart';

import 'package:hw_3/views/video_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouTube',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const YoutubeHomePage(title: 'Youtube Home Page'),
    );
  }
}

class YoutubeHomePage extends StatefulWidget {
  const YoutubeHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<YoutubeHomePage> createState() => _YoutubeHomePageState();
}

class _YoutubeHomePageState extends State<YoutubeHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: VideoDetailPage(),
    );
  }
}
