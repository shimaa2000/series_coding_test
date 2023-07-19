import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  const VideoView({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
      widget.url,
    ))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:const BoxConstraints(
        maxHeight: 300,
      ),
      child: Stack(
        children: [
          _controller.value.isInitialized
              ? ConstrainedBox(
                  constraints:const BoxConstraints(
                    maxHeight: 300,
                  ),
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                )
              : Container(),
          Positioned(
            top: 70,
            right: MediaQuery.sizeOf(context).width / 2.2,
            child: IconButton(
              onPressed: () {
                setState(() {
                  _controller.value.isPlaying ? _controller.pause() : _controller.play();
                });
              },
              icon: Icon(
                _controller.value.isPlaying ? Icons.pause_circle_filled_sharp : Icons.play_circle,
                color: Colors.white,
                size: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
