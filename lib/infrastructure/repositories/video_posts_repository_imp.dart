import 'package:flutter_tiktok/domain/datasources/video_post_datasource.dart';
import 'package:flutter_tiktok/domain/entities/video_post.dart';
import 'package:flutter_tiktok/domain/repositories/video_posts_repository.dart';

class VideoPostsRepositoryImp implements VideoPostsRepository {
  final VideoPostDataSource videosDataSource;

  VideoPostsRepositoryImp({required this.videosDataSource});

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    // TODO: implement getFavoriteVideosByUser
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videosDataSource.getTrendingVideosByPage(page);
  }
}
