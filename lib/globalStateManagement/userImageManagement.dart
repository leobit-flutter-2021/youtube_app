import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hw_3/data/data.dart';

class ImageManagement with ChangeNotifier {
  String _randomImage = currentUser.imageUrl;
  String get randomImage => _randomImage;

  void generateRandomImage() {
    var random = new Random();
    int min = 1;
    int max = 63707307;
    int result = min + random.nextInt(max - min);
    _randomImage = 'https://avatars.githubusercontent.com/u/$result';
    notifyListeners();
  }
}
