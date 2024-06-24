import 'package:dghub_video_player/dghub_video_player.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: DGHubVideoPlayer(
          config: VideoPlayerConfig(
              isLiveMode: true,
              onBack: () {},
              watermark: Align(
                  alignment: Alignment.topRight,
                  child:
                      Text('Watermark', style: TextStyle(color: Colors.white))),
              enabledFullScreenButton: true,
              title: 'Video Test',
              subtitles: [
                SubtitleModel(
                    label: 'English', url: 'https://pastebin.com/raw/ZWWAL7fK')
              ],
              movingText: 'dfdfdsafdsafds',
              movingTextColor: Colors.white.withOpacity(0.5),
              height: 200,
              width: MediaQuery.of(context).size.width,
              autoLoad:
                  'https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4')),
    );
  }
}
