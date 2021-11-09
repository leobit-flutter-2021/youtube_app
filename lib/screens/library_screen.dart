import 'package:flutter/material.dart';

import 'package:hw_3/data/colors.dart';

import 'package:hw_3/widgets/app_bar.dart';

class LibraryTab extends StatefulWidget {
  LibraryState createState() => LibraryState();
}

class LibraryState extends State<LibraryTab> {
  late String temp;
  List play_list = [];
  int like_counter = 0;

  @override
  void initState() {
    super.initState();

    play_list.addAll(['maks_playlist', 'vika_playlist', 'mykhailo_playlist']);
  }

  void _incrementCounter() {
    setState(() {
      like_counter++;
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
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.file_download, color: suvaGrey),
                  title:
                      Text('Downloads', style: TextStyle(color: Colors.white)),
                  subtitle: Text('2 recommendations',
                      style: TextStyle(color: suvaGrey, fontSize: 12.0)),
                ),
                ListTile(
                  leading: Icon(Icons.video_library, color: suvaGrey),
                  title: Text('Your videos',
                      style: TextStyle(color: Colors.white)),
                ),
                ListTile(
                  leading: Icon(Icons.attach_money, color: suvaGrey),
                  title:
                      Text('Purchases', style: TextStyle(color: Colors.white)),
                ),
                ListTile(
                  leading: Icon(Icons.watch_later, color: suvaGrey),
                  title: Text('Watch later',
                      style: TextStyle(color: Colors.white)),
                  subtitle: Text('Videos you save for later',
                      style: TextStyle(color: suvaGrey, fontSize: 12.0)),
                ),
                Divider(color: Colors.white),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Playlists',
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.0)),
                      Row(
                        children: <Widget>[
                          Text('Recently added',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0)),
                          Icon(Icons.arrow_drop_down, color: Colors.white)
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
                                      play_list.add(temp);
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
                  title: Text('Liked videos',
                      style: TextStyle(color: Colors.white)),
                  subtitle: Text('$like_counter Videos',
                      style: TextStyle(color: suvaGrey, fontSize: 12.0)),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: play_list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        key: Key(play_list[index]),
                        child: Card(
                          color: Color.fromRGBO(46, 46, 46, 1),
                          child: ListTile(
                            subtitle: Text('$like_counter Videos',
                                style:
                                    TextStyle(color: suvaGrey, fontSize: 12.0)),
                            leading:
                                Icon(Icons.featured_play_list, color: suvaGrey),
                            title: Text(play_list[index]),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.delete_sweep,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                setState(() {
                                  play_list.removeAt(index);
                                });
                              },
                            ),
                          ),
                        ),
                        onDismissed: (direction) {
                          setState(() {
                            play_list.removeAt(index);
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
