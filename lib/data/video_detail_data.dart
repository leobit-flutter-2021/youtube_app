class Video {
  String miniatureImagePath;
  String title;
  List<String> tags;
  int views;
  int likesCounter;
  int dislikesCounter;
  String timeAgo;
  Channel channel;

  Video(
    this.miniatureImagePath,
    this.title,
    this.channel, {
    this.tags = const [],
    this.views = 0,
    this.likesCounter = 0,
    this.dislikesCounter = 0,
    this.timeAgo = '1 minute ago',
  });
}

class Channel {
  String name;
  String logoImagePath;
  int subscribersCounter;

  Channel(
    this.name,
    this.logoImagePath, {
    this.subscribersCounter = 0,
  });
}

class Comment {
  String avatarImagePath;
  String username;
  String text;

  Comment(this.avatarImagePath, this.text, {this.username = 'null'});
}

class VideoComments {
  int numberOfComments;
  Comment topComment;

  VideoComments(
    this.topComment, {
    this.numberOfComments = 0,
  });
}

Channel currentChannel = Channel(
    'Fireship', 'assets/images/video_detail/logos/fireship_logo.jpg',
    subscribersCounter: 865000);

Video currentVideo = Video(
  'assets/images/video_detail/miniatures/0.jpg',
  'React Native vs Flutter - I built the same chat app with both',
  currentChannel,
  tags: ['#flutter', '#react', '#versus'],
  views: 282000,
  timeAgo: '1 week ago',
  likesCounter: 13000,
  dislikesCounter: 170,
);

VideoComments currentVideoComments = VideoComments(
    Comment(
        'assets/images/video_detail/avatars/avatar0.jpg',
        'I love this guy I literally asked for this video '
            'and he made it, he made the tech stacks video like so too. '
            'He is close to his viewers and comment...'),
    numberOfComments: 799);

final recommendations = [
  Video('assets/images/video_detail/miniatures/1.jpg',
      'How to OVER Engineer a Website // What is a Tech Stack?', currentChannel,
      views: 358000, timeAgo: '3 weeks ago'),
  Video(
      'assets/images/video_detail/miniatures/1.jpg',
      'No more real videos from Fireship, they didn\'t sponsor me',
      currentChannel,
      views: 0,
      timeAgo: '3 weeks ago'),
  Video('assets/images/video_detail/miniatures/1.jpg',
      'Seriously, no more real videos', currentChannel,
      views: 42, timeAgo: '3 weeks ago'),
  Video(
      'assets/images/video_detail/miniatures/1.jpg',
      'How to waste 3 hrs of your life on trying to render images with Genymotion',
      currentChannel,
      views: 9000000000,
      timeAgo: '3 weeks ago'),
  Video('assets/images/video_detail/miniatures/1.jpg',
      '...and end up using the Android Studio emulator', currentChannel,
      views: -2, timeAgo: '3 weeks ago'),
];
