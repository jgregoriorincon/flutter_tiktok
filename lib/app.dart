import 'package:flutter/material.dart';
import 'package:flutter_tiktok/config/themes/app_theme.dart';
import 'package:flutter_tiktok/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:flutter_tiktok/infrastructure/repositories/video_posts_repository_imp.dart';
import 'package:flutter_tiktok/presentation/providers/discover_provider.dart';
import 'package:flutter_tiktok/presentation/screens/discover/discover_screen.dart';
import 'package:provider/provider.dart';

class AppTikTok extends StatelessWidget {
  const AppTikTok({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository = VideoPostsRepositoryImp(
      videosDataSource: LocalVideoDatasource(),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create:
              (_) =>
                  DiscoverProvider(videosRepository: videoPostRepository)
                    ..loadNextVideo(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: DiscoverScreen(),
      ),
    );
  }
}
