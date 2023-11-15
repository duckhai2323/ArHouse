
import 'dart:io';
import '../models/video_list.dart';
import 'constants.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Services {
  static const baseUrl = 'www.googleapis.com';

  static Future<VideoList> getVideoList(String playListId) async {
    Map<String,String> parameters = {
      'part':'snippet',
      'playlistId':playListId,
      'key':Constants.KEY
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(
      baseUrl,
      '/youtube/v3/playlistItems',
      parameters,
    );
    Response response = await http.get(uri, headers: headers);
    VideoList videosList = videoListFromJson(response.body);
    return videosList;
  }
}