import 'package:flutter/material.dart';

import 'package:hw_3/data/data.dart';

import 'package:hw_3/screens/user_profile_screen.dart';

class CustomSliverAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  CustomSliverAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 100.0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Image.asset('assets/images/home_screen/logos/logo_dark.png'),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.cast),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          icon: CircleAvatar(
            foregroundImage: NetworkImage(currentUser.imageUrl),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserProfilePage(currentUser: currentUser),
              ),
            );
          },
        ),
      ],
    );
  }
}