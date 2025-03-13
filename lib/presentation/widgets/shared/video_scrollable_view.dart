import 'package:flutter/material.dart';
import 'package:flutter_tiktok/domain/entities/video_post.dart';
import 'package:flutter_tiktok/presentation/widgets/shared/fullscreen_player.dart';
import 'package:flutter_tiktok/presentation/widgets/shared/video_buttons.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;
  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost video = videos[index];
        return Stack(
          children: [
            // Video Player + gradiente
            SizedBox.expand(
              child: FullscreenPlayer(
                videoUrl: video.videoUrl,
                caption: video.caption,
              ),
            ),
            // FullScreenPlayer(video: video),
            // Botones
            VideoButtons(video: video),
          ],
        );
      },
    );
  }
}
