import 'package:flutter/material.dart';
import 'package:flutter_tiktok/config/app_theme.dart';
import 'package:flutter_tiktok/presentation/providers/discover_provider.dart';
import 'package:flutter_tiktok/presentation/screens/discover/discover_screen.dart';
import 'package:provider/provider.dart';

class AppTikTok extends StatelessWidget {
  const AppTikTok({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider()..loadNextVideo(),
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
