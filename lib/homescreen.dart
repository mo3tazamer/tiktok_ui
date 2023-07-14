import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late VideoPlayerController controller;

  get controllerx {
    controller = VideoPlayerController.asset(videos[0]);
    return controller;
  }

  void playVideo() {
    controller = VideoPlayerController.asset(videos[0])
      ..addListener(() {
        setState(() {});
      });
    controller.value.aspectRatio;
    controller.value.isLooping;
    controller.value.isInitialized;
    controller.initialize().then((value) => controller.play());
  }

  @override
  void initState() {
    playVideo();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  var control = PageController();

  List videos = [
    'assets/7.mp4',
    'assets/8.mp4',
    'assets/9.mp4',
    'assets/10.mp4',
    'assets/3.mp4'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(alignment: AlignmentDirectional.bottomEnd, children: [
          InkWell(
            onTap: (){
            setState(() {
              controller.value.isPlaying
                  ? controller.pause()
                  : controller.play();
            });

          },
            child: Container(
                //color: Colors.red,
                height: double.infinity,
                width: double.infinity,
                child:controller.value.isInitialized?
                PageView(
                 scrollDirection: Axis.vertical,
                  controller: control,
                 children: [AspectRatio(
                   aspectRatio: controller.value.aspectRatio,
                   child: VideoPlayer(controller),
                 )],
                  /*onPageChanged: (i) {
                    setState(() {
                      controller.play();
                    });
                  },*/
                ):const Center(child: CircularProgressIndicator(color: Colors.white,))),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 78,
                  child: CircleAvatar(
                      radius: 30,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(15)),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            )),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.heart_broken,
                      size: 33,
                      color: Colors.white,
                    )),
                const SizedBox(
                  height: 18,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.message,
                      size: 33,
                      color: Colors.white,
                    )),
                const SizedBox(
                  height: 18,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                      size: 33,
                      color: Colors.white,
                    )),
                const SizedBox(
                  height: 18,
                ),
                const CircleAvatar(),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
