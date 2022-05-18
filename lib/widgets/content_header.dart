import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import './vertical_icon_button.dart';
import './responsive.dart';

import '../models/content_model.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;
  const ContentHeader({required this.featuredContent, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: _ContentHeaderDesktop(
        featuredContent: featuredContent,
      ),
      mobile: _ContentHeaderMobile(
        featuredContent: featuredContent,
      ),
    );
  }
}

class _ContentHeaderDesktop extends StatefulWidget {
  final Content featuredContent;
  const _ContentHeaderDesktop({required this.featuredContent, Key? key}) : super(key: key);

  @override
  State<_ContentHeaderDesktop> createState() => _ContentHeaderDesktopState();
}

class _ContentHeaderDesktopState extends State<_ContentHeaderDesktop> {
  late VideoPlayerController _videoController;
  var _isMuted = true;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.network(widget.featuredContent.videoUrl)..initialize().then((value) {
      setState(() {

      });
    })..setVolume(0)..play();
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _videoController.value.isPlaying
            ?
        _videoController.pause()
            :
        _videoController.play();
      },
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          AspectRatio(
            aspectRatio: _videoController.value.isInitialized ? _videoController.value.aspectRatio : 2.344,
            child: _videoController.value.isInitialized ? VideoPlayer(_videoController) : Image.asset(widget.featuredContent.imageUrl, fit: BoxFit.cover),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -1.0,
            child: AspectRatio(
              aspectRatio: _videoController.value.isInitialized ? _videoController.value.aspectRatio : 2.344,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter
                  )
                ),
              ),
            ),
          ),
          Positioned(
            left: 60,
            right: 60,
            bottom: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250.0,
                  child: Image.asset(widget.featuredContent.titleImageUrl),
                ),
                const SizedBox(height: 15.0),
                Text(widget.featuredContent.description, style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(2.0, 4.0),
                      blurRadius: 6.0
                    )
                  ]
                ),),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    const _PlayButton(),
                    const SizedBox(width: 16.0),
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: const [
                          Icon(Icons.info_outline, color: Colors.white),
                          SizedBox(width: 4.0),
                          Text(
                            "More Info",
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    if (_videoController.value.isInitialized)
                      IconButton(
                        iconSize: 30.0,
                        onPressed: () {
                          setState(() {
                            if(_isMuted) {
                              _videoController.setVolume(200);
                            } else {
                              _videoController.setVolume(0);
                            }
                            _isMuted = _videoController.value.volume == 0;
                          });
                        },
                        icon: Icon(_isMuted ? Icons.volume_off : Icons.volume_up),
                        color: Colors.white,
                      )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class _ContentHeaderMobile extends StatelessWidget {
  final Content featuredContent;
  const _ContentHeaderMobile({required this.featuredContent, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(featuredContent.imageUrl),
                fit: BoxFit.cover
            ),
          ),
        ),
        Container(
          height: 501,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter
              )
          ),
        ),
        Positioned(
          bottom: 110.0,
          child: SizedBox(
            width: 250,
            child: Image.asset(featuredContent.titleImageUrl),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalIconButton(
                  icon: Icons.add,
                  title: "My List",
                  onTap: () {}
              ),
              const _PlayButton(),
              VerticalIconButton(
                  icon: Icons.info_outline,
                  title: "Info",
                  onTap: () {}
              )
            ],
          ),
        )
      ],
    );
  }
}



class _PlayButton extends StatelessWidget {
  const _PlayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
      ),
      onPressed: () {},
      child: Row(
        children: const [
          Icon(Icons.play_arrow, size: 30.0, color: Colors.black),
          SizedBox(width: 5.0),
          Text("Play", style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Colors.black
          ))
        ],
      )
    );
  }
}

