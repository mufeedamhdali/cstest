import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/response/image_response.dart';
import '../service/image_service.dart';
import '../di_container.dart';

class AppImageProvider extends ChangeNotifier {

  ImageService imageService;
  SharedPreferences sharedPreferences = sl();

  List<AppImage> images = [];

  AppImageProvider({required this.imageService});

  Future<List<AppImage>> getImages() async {
    images =  await ImageService(sharedPreferences: sharedPreferences).getImages();
    notifyListeners();
    return images;
  }

}