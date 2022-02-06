import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:netflix_ui_clone_flutter/extensions.dart';
import 'package:netflix_ui_clone_flutter/models/content_model.dart';
import 'package:netflix_ui_clone_flutter/widgets/widgets.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:video_player/video_player.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;

  const ContentHeader({Key? key, required this.featuredContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.isDesktop
        ? _ContentHeaderDesktop(
            featuredContent: featuredContent,
          )
        : _ContentHeaderMobile(
            featuredContent: featuredContent,
          );
  }
}

class _ContentHeaderDesktop extends StatefulWidget {
  const _ContentHeaderDesktop({Key? key, required this.featuredContent})
      : super(key: key);

  final Content featuredContent;

  @override
  State<_ContentHeaderDesktop> createState() => _ContentHeaderDesktopState();
}

class _ContentHeaderDesktopState extends State<_ContentHeaderDesktop> {
  late VideoPlayerController _videoController;
  bool _isMuted = true;

  @override
  void initState() {
    super.initState();
    _videoController =
        VideoPlayerController.network(widget.featuredContent.videoUrl!)
          ..initialize().then((value) => setState(() {}))
          ..setVolume(0)
          ..play();
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
  }

  void _playPauseVideo() => _videoController.value.isPlaying
      ? _videoController.pause()
      : _videoController.play();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _playPauseVideo,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          AspectRatio(
            aspectRatio: _videoController.value.isInitialized
                ? _videoController.value.aspectRatio
                : 2.34,
            child: _videoController.value.isInitialized
                ? VideoPlayer(_videoController)
                : Image.asset(
                    widget.featuredContent.imageUrl,
                    fit: BoxFit.cover,
                  ),
          ),
          Positioned(
            bottom: -1,
            left: 0,
            right: 0,
            child: AspectRatio(
              aspectRatio: _videoController.value.isInitialized
                  ? _videoController.value.aspectRatio
                  : 2.34,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 500,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
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
                  width: 250,
                  child: Image.asset(
                    widget.featuredContent.titleImageUrl!,
                  ),
                ),
                15.heightBox,
                widget.featuredContent.description!.text.white
                    .fontWeight(FontWeight.w500)
                    .size(18)
                    .shadowBlur(6)
                    .shadowColor(Colors.black)
                    .shadowOffset(2, 4)
                    .make(),
                20.heightBox,
                Row(
                  children: [
                    const _PlayButton(),
                    16.widthBox,
                    FlatButton.icon(
                      onPressed: () => print('More Info'),
                      color: Colors.black45.withOpacity(0.4),
                      icon: const Icon(
                        Icons.info_outline,
                        color: Colors.white,
                      ),
                      label: 'More Info'
                          .text
                          .white
                          .size(16)
                          .fontWeight(FontWeight.w600)
                          .make(),
                    ),
                  ],
                )
              ],
            ),
          ),
          //if video loaded
          if (_videoController.value.isInitialized)
            Positioned(
              right: 40,
              bottom: 150,
              child: IconButton(
                icon: Icon(
                  _isMuted ? Icons.volume_off : Icons.volume_up,
                  color: Colors.white.withOpacity(0.6),
                ),
                iconSize: 30,
                onPressed: () => setState(
                  () {
                    _videoController.setVolume(_isMuted ? 100 : 0);
                    _isMuted = _videoController.value.volume == 0;
                  },
                ),
              ),
            )
        ],
      ),
    );
  }
}

class _ContentHeaderMobile extends StatelessWidget {
  const _ContentHeaderMobile({Key? key, required this.featuredContent})
      : super(key: key);

  final Content featuredContent;

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
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 500,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 110,
          child: SizedBox(
            width: 250,
            child: Image.asset(featuredContent.imageUrl),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalIconButton(
                icon: Icons.add,
                title: 'List',
                onTap: () => print('My List'),
              ),
              const _PlayButton(),
              VerticalIconButton(
                icon: Icons.info_outline,
                title: 'Info',
                onTap: () => print('Info'),
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
    return FlatButton.icon(
      onPressed: () => print('Play'),
      label: 'Play'.text.white.size(16).fontWeight(FontWeight.w600).make(),
      icon: const Icon(
        Icons.play_arrow,
        size: 30,
        color: Colors.white,
      ),
      color: Colors.black45.withOpacity(0.4),
    ).pLTRB(15, 5, 20, 5);
  }
}
