import 'package:deledocdoctor/controllers/vodeocall/videocall.dart';
import 'package:deledocdoctor/views/screens/prescription/prescriptopn.dart';
import 'package:flutter/material.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:get/get.dart';

class VideoCallScreenUikit extends StatefulWidget {

  @override
  // ignore: library_private_types_in_public_api
  _VideoCallScreenState createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreenUikit> {
  final VideoCallController videocontroller = Get.put(VideoCallController());
  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData( 
      appId: "ab0681cef04a45d089df7dd7e0cb144d",
      channelName: "test4",
      tempToken:
          "007eJxTYGhdek/0s2Kn94X4Ug8H1nVFs24IZ5zLFvq0rm+LXNfkmw8VGBKTDMwsDJNT0wxMEk1MUwwsLFPSzFNSzFMNkpMMTUxSrj5vSWsIZGRYrWnAzMgAgSA+K0NJanGJCQMDAMdIIT4=",
    ),
  );

  bool _isCameraEnabled = true;
  bool _isMicEnabled = true;

  @override
  void initState() {
    super.initState();
    _initAgora();
  }

  Future<void> _initAgora() async {
    await client.initialize();
  }

  @override
  void dispose() {
    client.engine.leaveChannel();
    super.dispose();
  }

  void offCamera() {
    setState(() {
      _isCameraEnabled = !_isCameraEnabled;
    });
    client.engine.muteLocalVideoStream(!_isCameraEnabled);
  }

  void toggleMic() {
    setState(() {
      _isMicEnabled = !_isMicEnabled;
    });
    client.engine.muteLocalAudioStream(!_isMicEnabled);
  }

  void switchCamera() {
    client.engine.switchCamera();
  }

  void leaveCall() async {
    await videocontroller.deleteDoc();
    client.engine.leaveChannel();
    Get.off(PrescriptionScreen(userId: videocontroller.userId.value,name: "",));
   // Navigator.of(context).pop(); // Example: Navigate back to previous screen
  }

  Widget _buildControlButton(
      IconData icon, Color color, VoidCallback onPressed) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black54,
      ),
      child: IconButton(
        icon: Icon(icon, color: color),
        onPressed: onPressed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: AgoraVideoViewer(
                client: client,
                layoutType: Layout.oneToOne,
                enableHostControls: true,
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildControlButton(
                    _isCameraEnabled ? Icons.videocam : Icons.videocam_off,
                    Colors.white,
                    offCamera,
                  ),
                  const SizedBox(width: 20),
                  _buildControlButton(
                    _isMicEnabled ? Icons.mic : Icons.mic_off,
                    Colors.white,
                    toggleMic,
                  ),
                  const SizedBox(width: 20),
                  _buildControlButton(
                    Icons.switch_camera,
                    Colors.white,
                    switchCamera,
                  ),
                  const SizedBox(width: 20),
                  _buildControlButton(
                    Icons.call_end,
                    Colors.red,
                    leaveCall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
