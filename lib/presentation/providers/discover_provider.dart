import 'package:flutter/material.dart';
import 'package:flutter_tiktok/domain/entities/video_post.dart';
import 'package:flutter_tiktok/infrastructure/repositories/video_posts_repository_imp.dart';

class DiscoverProvider extends ChangeNotifier {
  // TODO: Repository, DataSources, and UseCases are not implemented yet
  final VideoPostsRepositoryImp videosRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videosRepository});

  Future<void> loadNextVideo() async {
    await Future.delayed(const Duration(seconds: 2));

    // final List<VideoPost> newVideos =
    //     videoPosts
    //         .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
    //         .toList();

    final newVideos = await videosRepository.getTrendingVideosByPage(1);
    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
