import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:thietthach_app/pages/knowledge/utils/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'models/video_list.dart';

class KnowledgeController extends GetxController{
  final loading = true.obs;
  static const String PLAYLISTID_PREPARE = 'PLZQ3BoymAFkUvKxHCkZfERurJxjOTJLcW';
  final List<VideoItem> listVideoPrepare = <VideoItem>[].obs;
  YoutubePlayerController youtubeController1 = YoutubePlayerController(initialVideoId: '');
  late Video video1;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    VideoList videoList = await Services.getVideoList(PLAYLISTID_PREPARE);
    listVideoPrepare.addAll(videoList.videos);
    video1 = listVideoPrepare[0].video;
    youtubeController1 = YoutubePlayerController(
      initialVideoId: listVideoPrepare[0].video.resourceId.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );
    loading.value = false;
  }

  void HandleVideo1 (int index){
    video1 = listVideoPrepare[index].video;
    youtubeController1 = YoutubePlayerController(
      initialVideoId: listVideoPrepare[index].video.resourceId.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );
    print(index);
  }
}