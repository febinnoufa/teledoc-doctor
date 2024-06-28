import 'package:deledocdoctor/controllers/vodeocall/videocall.dart';
import 'package:deledocdoctor/views/screens/prescription/prescriptopn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:agora_uikit/agora_uikit.dart';



class VideoCallScreenUikit extends StatefulWidget {
  final String uid; 

  final String name;

  VideoCallScreenUikit({required this.uid, required this.name});
  @override
  _VideoCallScreenState createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreenUikit> {
  //late VideoCallController videoCallController;
  //late String token;
  // late AgoraClient _client;
  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: "ab0681cef04a45d089df7dd7e0cb144d",
      channelName: "teledoc",
      tempToken:
          "007eJxTYDD8frZlg6Rahqnu/QMzJSd1PcrawjFVn4F13+G7k5peCuYoMCQmGZhZGCanphmYJJqYphhYWKakmaekmKcaJCcZmpikBCytTmsIZGRYsj2HmZEBAkF8doaS1JzUlPxkBgYAshshAg==",
    ),
  );

  @override
  void initState() {
    super.initState();
    _initAgora();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   videoCallController =
  //       Get.put(VideoCallController()); // Initialize your GetX controller
  //   videoCallController.fetchVideoCallData().then((_) {
  //     setState(() {
  //       token = videoCallController.videoCallData.isNotEmpty
  //           ? videoCallController.videoCallData[0]['token']
  //           : '';
  //       print("Token: $token");
  //       _client = AgoraClient(
  //         agoraConnectionData: AgoraConnectionData(
  //           appId:
  //               "ab0681cef04a45d089df7dd7e0cb144d", // Replace with your App ID
  //           channelName: "teledoc", // Replace with your channel name
  //           tempToken: "007eJxTYDD8frZlg6Rahqnu/QMzJSd1PcrawjFVn4F13+G7k5peCuYoMCQmGZhZGCanphmYJJqYphhYWKakmaekmKcaJCcZmpikBCytTmsIZGRYsj2HmZEBAkF8doaS1JzUlPxkBgYAshshAg==",
  //         ),
  //       );
  //       _initAgora();
  //     });
  //   });
  // }

  Future<void> _initAgora() async {
    await client.initialize();
  }

  Future<void> _endCallAndNavigateHome() async {
    await client.engine.leaveChannel();
    Get.off(PrescriptionScreen(
      userId: widget.uid,
      name: widget.name,
    )); 
  }

  @override
  void dispose() {
    client.engine?.leaveChannel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Agora Video Call'),
      // ),
      body: SafeArea(
        child: GetBuilder<VideoCallController>(
          // init: videoCallController,
          builder: (_) => Stack(
            children: [
              AgoraVideoViewer(
                client: client,
                layoutType: Layout.oneToOne,
                enableHostControls:
                    true, 
              ),
           
              Positioned(
                bottom: 20,
                right: 20,
                child: FloatingActionButton(
                 
                  onPressed: _endCallAndNavigateHome,
                  child: const Icon(Icons.call_end),
                  backgroundColor: Colors.red,
                ),
              ),
              AgoraVideoButtons(client: client),
            ],
          ),
        ),
      ),
    );
  }
}
