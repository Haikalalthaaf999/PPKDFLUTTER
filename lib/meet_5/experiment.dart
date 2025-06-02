import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MaterialApp(home: VideoInkWell()));
}

class VideoInkWell extends StatefulWidget {
  const VideoInkWell({super.key});

  @override
  State<VideoInkWell> createState() => _VideoInkWellState();
}

class _VideoInkWellState extends State<VideoInkWell> {
  late VideoPlayerController _controller;
  bool _isVideoInitialized = false;
  bool _showText = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    // Inisialisasi video dari assets
    _controller = VideoPlayerController.asset('assets/videos/dodge.mp4')
      // Alternatif: Gunakan URL untuk testing
      // _controller = VideoPlayerController.network('https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4')
      ..initialize()
          .then((_) {
            setState(() {
              _isVideoInitialized = true;
            });
          })
          .catchError((error) {
            setState(() {
              _errorMessage = 'Gagal memuat video: $error';
            });
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Video InkWell",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff537D5D),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red, fontSize: 14),
                ),
              ),
            if (_errorMessage == null)
              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.red.withOpacity(0.5),
                  onTap: () {
                    print("Kotak disentuh");
                    setState(() {
                      _showText = !_showText;
                      if (_isVideoInitialized) {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      }
                    });
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      _isVideoInitialized
                          ? AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          )
                          : const SizedBox(
                            width: 200,
                            height: 200,
                            child: Center(child: CircularProgressIndicator()),
                          ),
                      if (_showText)
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            "Kotak ini disentuh!",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
