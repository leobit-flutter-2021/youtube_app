import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hw_3/screens/nav_screen.dart';
import 'package:provider/provider.dart';

import 'globalStateManagement/userImageManagement.dart';

void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_)=>ImageManagement()),
          ],
          child: MyApp()
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var incrementValue = context.watch<Increment>().count;

    return MaterialApp(
      title: 'Flutter YouTube UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        bottomNavigationBarTheme:
            const BottomNavigationBarThemeData(selectedItemColor: Colors.white),
      ),
      home: NavScreen()
    );
  }
}
