import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:machine/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/response/image_response.dart';

class ImageService {

  final SharedPreferences sharedPreferences;
  ImageService({required this.sharedPreferences});

  Future<List<AppImage>> getImages() async {
    String searchKey = sharedPreferences.getString(Constants.spSearchKey) ?? "";
    final uri = Uri.parse(Constants.apiUrl + "&q=" + searchKey + "&image_type=photo");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return ImageResponse.fromJson(body).images ?? [];
    } else {
      throw Exception("Unable to perform request!");
    }
  }

}
