import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourseVideo extends StatefulWidget {
  const CourseVideo({Key? key}) : super(key: key);

  @override
  State<CourseVideo> createState() => _CourseVideoState();
}

class _CourseVideoState extends State<CourseVideo> {
  late YoutubePlayerController _controller;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  final List<String> _ids = [
    'HtgsoZieoeM',
    'Si5XJ_IocEs',
    'VdkRy3yZiPo',
    'biwlOk86URc',
  ];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _ids.first,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        captionLanguage: "en-us",
        controlsVisibleAtStart: true,
        forceHD: true,
        hideControls: false,
        hideThumbnail: false,
        disableDragSeek: false,
        mute: false,
        showLiveFullscreenButton: true,
        enableCaption: true,
        loop: true,
      ),
    );
    _videoMetaData = const YoutubeMetaData();
    _videoMetaData = _controller.metadata;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: YoutubePlayerBuilder(
            // onExitFullScreen: () {
            //   // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
            //   SystemChrome.setPreferredOrientations(DeviceOrientation.values);
            // },
            player: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              topActions: <Widget>[
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    _controller.metadata.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
              onReady: () {
                _isPlayerReady = true;
              },
              onEnded: (data) {
                _controller
                    .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
              },
            ),
            builder: (context, player) {
              return
                Column(
                  children: [
                    player,
                    RichText(
                      text: TextSpan(
                        text: 'Title : ',
                        style: const TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: _controller.metadata.title,
                            style: const TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                            text: "\n Duration : ${_controller.metadata.duration}",
                            style: const TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );

            },
        ),
      ),
    );
  }
}