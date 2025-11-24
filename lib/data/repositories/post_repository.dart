import "../models/post.dart";
import "../services/post_service.dart";
class PostRepository {
  final PostService service;
  List<Post>? _cache;
  PostRepository({required this.service});
  Future<List<Post>> getPosts({bool forceRefresh=false})async{
    if(!forceRefresh &&_cache!=null)return _cache!;
    try{
      final list =await service.fetchPosts();
      final posts=list.map((m)=>Post.fromJson(m)).toList();
      _cache=posts;
      return posts;
    }
    catch(e){
      rethrow;
    }
  }
}