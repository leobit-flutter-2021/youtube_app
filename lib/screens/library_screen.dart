import 'package:flutter/material.dart';

import 'package:hw_3/data/colors.dart';

import 'package:hw_3/widgets/app_bar.dart';

class LibraryTab extends StatefulWidget {
  LibraryState createState() => LibraryState();
}

class LibraryState extends State<LibraryTab> {
  late String temp;
  List playList = [];
  int likeCounter = 0;

  @override
  void initState() {
    super.initState();

    playList.addAll(['maks_playlist', 'vika_playlist', 'mykhailo_playlist']);
  }

  void _incrementCounter() {
    setState(() {
      likeCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.history, color: suvaGrey),
                  title: Text(
                    'History',
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.file_download, color: suvaGrey),
                  title: Text(
                    'Downloads',
                  ),
                  subtitle: Text('2 recommendations',
                      style: TextStyle(color: suvaGrey, fontSize: 12.0)),
                ),
                ListTile(
                  leading: Icon(Icons.video_library, color: suvaGrey),
                  title: Text(
                    'Your videos',
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.attach_money, color: suvaGrey),
                  title: Text('Purchases'),
                ),
                ListTile(
                  leading: Icon(Icons.watch_later, color: suvaGrey),
                  title: Text(
                    'Watch later',
                  ),
                  subtitle: Text('Videos you save for later',
                      style: TextStyle(color: suvaGrey, fontSize: 12.0)),
                ),
                Divider(color: suvaGrey),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Playlists', style: TextStyle(fontSize: 16.0)),
                      Row(
                        children: <Widget>[
                          Text('Recently added',
                              style: TextStyle(fontSize: 16.0)),
                          Icon(Icons.arrow_drop_down, color: suvaGrey)
                        ],
                      )
                    ],
                  ),
                ),
                ListTile(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Add playlist'),
                            content: TextField(
                              onChanged: (String value) {
                                temp = value;
                              },
                            ),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      playList.add(temp);
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Add'))
                            ],
                          );
                        });
                  },
                  leading: Icon(Icons.add, color: linkBlue),
                  title:
                      Text('New Playlist', style: TextStyle(color: linkBlue)),
                ),
                ListTile(
                  onTap: _incrementCounter,
                  leading: Icon(Icons.thumb_up, color: suvaGrey),
                  title: Text(
                    'Liked videos',
                  ),
                  subtitle: Text('$likeCounter Videos',
                      style: TextStyle(color: suvaGrey, fontSize: 12.0)),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: playList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        key: Key(playList[index]),
                        child: Card(
                          child: ListTile(
                            subtitle: Text('$likeCounter Videos',
                                style:
                                    TextStyle(color: suvaGrey, fontSize: 12.0)),
                            leading:
                                Icon(Icons.featured_play_list, color: suvaGrey),
                            title: Text(playList[index]),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.delete_sweep,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                setState(() {
                                  playList.removeAt(index);
                                });
                              },
                            ),
                          ),
                        ),
                        onDismissed: (direction) {
                          setState(() {
                            playList.removeAt(index);
                          });
                        },
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
