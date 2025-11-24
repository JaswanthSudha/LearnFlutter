import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/post_provider.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.watch<PostProvider>());
  }

  @override
  Widget build(BuildContext context) {
    final prov = context.watch<PostProvider>();

    if (prov.loading && !prov.hasData()) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
        actions: [
          IconButton.outlined(
            onPressed: () => prov.load(refresh: true),
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: prov.error != null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    prov.error!,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => prov.load(),
                    child: const Text("Retry"),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                final post = prov.posts[index];
                return ListTile(
                  title: Text('$post.title'),
                  subtitle: Text(post.body, maxLines: 2),
                  leading: CircleAvatar(child: Text(post.id.toString())),
                );
              },
            ),
    );
  }
}
