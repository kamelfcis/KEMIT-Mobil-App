import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  final String token;
  final String groupId;
  final String imageUrl;
  final String videoUrl;

  const VideoPage({
    required this.token,
    required this.groupId,
    required this.imageUrl,
    required this.videoUrl,
  });

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  VideoPlayerController? _controller;
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    print("Video URL: ${widget.videoUrl}");
    _initializeVideo();
  }

 
 Future<void> _initializeVideo() async {
  try {
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          _isLoading = false;
        });
        _controller!.play();
      }).catchError((error) {
        setState(() {
          _hasError = true;
          _isLoading = false;
        });
        print("Error during video initialization: $error");
      });
  } catch (e) {
    setState(() {
      _hasError = true;
      _isLoading = false;
    });
    print("Unexpected error: $e");
  }
}

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Video Player")),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : _hasError
                ? Text("Failed to load video.")
                : _controller != null && _controller!.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller!.value.aspectRatio,
                        child: Container(
                          height:
                              300, // Set a fixed height for better visualization
                          child: AspectRatio(
                            aspectRatio: _controller!.value.aspectRatio,
                            child: VideoPlayer(_controller!),
                          ),
                        ),
                      )
                    : Text("Loading video..."),
      ),
      floatingActionButton: _controller != null &&
              _controller!.value.isInitialized &&
              !_isLoading
          ? FloatingActionButton(
              onPressed: () {
                setState(() {
                  _controller!.value.isPlaying
                      ? _controller!.pause()
                      : _controller!.play();
                });
              },
              child: Icon(
                _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            )
          : null,
    );
  }
}
