import 'package:flutter/material.dart';
import 'package:flutter_tiktok/domain/entities/video_post.dart';
import 'package:flutter_tiktok/infrastructure/models/local_video_model.dart';
import 'package:flutter_tiktok/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  // TODO: Repository, DataSources, and UseCases are not implemented yet

  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextVideo() async {
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos =
        videoPosts
            .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
            .toList();

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
