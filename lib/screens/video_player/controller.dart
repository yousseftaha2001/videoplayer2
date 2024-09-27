import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:video_player/video_player.dart';

// import 'package:video_player/video_player.dart';
class MyVideoPlayerController extends GetxController {
  final videoPlayerController = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
  late var chewieController;
  late var chewieController2;
  RxBool isMiniplayer = true.obs;
  initdata() async {
    await videoPlayerController.initialize();
    chewieController = ChewieController(
      aspectRatio: 2,
      videoPlayerController: videoPlayerController,
      // fullScreenByDefault: true,
      autoPlay: false,
      looping: false,
    );
    chewieController2 = ChewieController(
     
      videoPlayerController: videoPlayerController,
    
      autoPlay: false,
      looping: false,
      showControls: false,
    );
    update();
  }

 
  void closeVideoPlayer() {
    videoPlayerController.dispose();
    chewieController.dispose();
    chewieController2.dispose();
    isMiniplayer.value = false;
   
    update();
  }

  MiniplayerController miniplayerController = MiniplayerController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initdata();
  }


}
