import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  final String filePath;
  final String selectIndex;

  const VideoPage({Key? key, required this.filePath, required this.selectIndex})
      : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _videoPlayerController;
  late String fileVideo;
  late String character;

  @override
  void initState() {
    super.initState();
    fileVideo = widget.filePath;
    character = widget.selectIndex;
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Future _initVideoPlayer() async {
    _videoPlayerController = VideoPlayerController.file(File(fileVideo));
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    await _videoPlayerController.play();
  }

  String changeFileName(String originalPath, String newFileName) {
    File originalFile = File(originalPath);
    String newPath = originalPath.replaceAll(
      RegExp(
        r'[^\/]*(?=(\/|$))',
        caseSensitive: false,
        multiLine: false,
      ),
      newFileName,
    );

    originalFile.renameSync(newPath);

    return newPath;
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> uploadVideo(String filePath, String fileName) async {
    File file = File(filePath);
    DateTime now = DateTime.now();

    String formattedDate = DateFormat('HH_mm_ss_dd_MM_yyyy').format(now);
    try {
      Reference ref = FirebaseStorage.instance
          .ref("video")
          .child('$character/${fileName}_${formattedDate}.mp4');
      UploadTask uploadTask = ref.putFile(file);

      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();

      print('File uploaded to: $downloadUrl');
    } catch (e) {
      print('Error uploading file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // String newFileName = '${widget.selectIndex}.mp4';
    // String newPath = changeFileName(widget.filePath, newFileName);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
        elevation: 0,
        backgroundColor: Colors.black26,
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              showSnackBar('Video đã được tải lên thành công!');
              String newFileName = widget.selectIndex;
              uploadVideo(widget.filePath, newFileName);
              print('do something with the file $newFileName');
            },
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: FutureBuilder(
        future: _initVideoPlayer(),
        builder: (context, state) {
          if (state.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return VideoPlayer(_videoPlayerController);
          }
        },
      ),
    );
  }
}
