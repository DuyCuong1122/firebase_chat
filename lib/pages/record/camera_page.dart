import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'character.dart';
import 'video_page.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  bool _isLoading = true;
  bool _isRecording = false;
  late CameraController _cameraController;
  int timeRecord = 5;
  int remainingTime = 0;
  late StreamController<int> _countdownController;
  String _selectedIndex = character.first;

  String selectedTime = listTime.first;
  @override
  void initState() {
    super.initState();

    _initCamera();

    _isRecording = false;
  }

  @override
  void dispose() {
    _cameraController.dispose();
    _countdownController.close();
    super.dispose();
  }

  _initCamera() async {
    final cameras = await availableCameras();
    final front = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front);
    _cameraController = CameraController(front, ResolutionPreset.max);
    await _cameraController.initialize();
    setState(() => _isLoading = false);
  }

  int stringToInt(String a) {
    var myInt = int.parse(a);
    return myInt;
  }

  _stopRecording() async {
    if (_cameraController.value.isRecordingVideo) {
      await _cameraController.stopVideoRecording();
    }
    setState(() => _isRecording = false);
  }

  _recordVideo(int time_record) async {
    if (_isRecording) {
      final file = await _cameraController.stopVideoRecording();
      setState(() => _isRecording = false);
      final route = MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => VideoPage(
          filePath: file.path,
          selectIndex: _selectedIndex,
        ), //
      );
      Navigator.push(context, route);
    } else {
      await _cameraController.prepareForVideoRecording();
      await _cameraController.startVideoRecording();
      setState(() => _isRecording = true);
      // _startCountdown();
      await Future.delayed(Duration(seconds: time_record));
      final file = await _cameraController.stopVideoRecording();
      setState(() => _isRecording = false);

      final route = MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => VideoPage(
          filePath: file.path,
          selectIndex: _selectedIndex,
        ),
      );
      Navigator.push(context, route);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Container(
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                AspectRatio(
                  aspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height -
                          56), //_cameraController.value.aspectRatio
                  child: CameraPreview(_cameraController),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: SizedBox(
                      width: 100, // Adjust the width as needed
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 4, color: Colors.purpleAccent),
                        ),
                        child: Image.asset(
                          'assets/character_image/$_selectedIndex.png',
                          fit: BoxFit
                              .fitHeight, // Fit image to the container's height
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: DropdownButton<String>(
                    value: _selectedIndex,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        _selectedIndex = value!;
                      });
                    },
                    items:
                        character.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Positioned(
                  top: 60,
                  right: 20,
                  child: DropdownButton<String>(
                    value: selectedTime,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        selectedTime = value!;
                      });
                    },
                    items:
                        listTime.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: FloatingActionButton(
                    backgroundColor: _isRecording ? Colors.blue : Colors.red,
                    child: const Icon(Icons.circle),
                    onPressed: () => _recordVideo(stringToInt(selectedTime)),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
  }
}
