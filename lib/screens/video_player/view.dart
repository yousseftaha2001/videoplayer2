import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:videoplayer/screens/video_player/controller.dart';

// import 'package:video_player/video_player.dart';

class MyCustomPlayerScreen extends StatelessWidget {
  MyCustomPlayerScreen({super.key});
  final controller = Get.put(MyVideoPlayerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<MyVideoPlayerController>(
      builder: (co) {
        return Container(
          height: Get.height,
          width: Get.width,
          child: Stack(
            children: [
              Obx(() {
                return controller.isMiniplayer.value
                    ? Miniplayer(
                        onDismiss: () {
                          // miniplayerController.onDismiss();
                          // print('object');
                        },
                        controller: controller.miniplayerController,
                        minHeight: Get.height * 0.1,
                        maxHeight: Get.height,
                        builder: (height, percentage) {
                          if (percentage > 0.1) {
                            return Container(
                              height: Get.height,
                              width: Get.width,
                              // color: Colors.red,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: Get.height / 4,
                                    child: Chewie(
                                      controller: controller.chewieController,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return Container(
                              height: Get.height * 0.1,
                              color: Colors.black,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: Get.width / 3,
                                    child: Chewie(
                                      controller: controller.chewieController2,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'video 1',
                                      style:
                                          Get.textTheme.displayLarge!.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        controller.closeVideoPlayer();
                                      },
                                      icon: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                            );
                          }
                          //return Text('mini');
                        },
                      )
                    : Container();
              })
            ],
          ),
        );
      },
    ));
  }
}
