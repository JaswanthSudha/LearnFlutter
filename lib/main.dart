import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './provider/post_provider.dart';
import './data/repositories/post_repository.dart';
import './data/services/post_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<PostService>(create: (_) => PostService()),
        ProxyProvider<PostService, PostRepository>(
          update: (_, service, __) => PostRepository(service: service),
        ),
        ChangeNotifierProxyProvider<PostRepository, PostProvider>(
          create: (_) => PostProvider(repo: PostRepository(service: PostService())),
          update: (_, repo, prev) =>
              prev!..),
        // Simpler alternative:
        ChangeNotifierProvider(
          create: (ctx) => PostProvider(
            repo: PostRepository(service: PostService()),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Scaffold(body: Center(child: Text('Hello, World!'))),
    );
  }
}
