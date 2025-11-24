import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/posts_screen.dart';
import 'package:provider/provider.dart';
import './provider/post_provider.dart';
import './data/repositories/post_repository.dart';
import './data/services/post_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>
              PostProvider(repo: PostRepository(service: PostService())),
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
      home: const PostsScreen()
    );
  }
}
