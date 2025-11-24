import "package:flutter/foundation.dart";
import "../data/models/post.dart";
import '../data/repositories/post_repository.dart';
class PostProvider extends ChangeNotifier{
  final PostRepository _repo;
  PostProvider({required PostRepository repo}):_repo=repo;
  List<Post> _posts=[];
  bool _loading =false;
  String? _error;
  List<Post>get posts=>_posts;
  bool get loading =>_loading;
  String? get error =>_error;
  Future<void> load({bool refresh =false})async{
    _loading=true;
    _error=null;
    notifyListeners();
    try{
      final data=await _repo.getPosts(forceRefresh: refresh);
      _posts=data;

    }
    catch(e){
      _error="failed to load posts";
    }
    finally{
      _loading=false;
      notifyListeners(); 
    }
  }
  bool hasData(){
    if(_posts.isEmpty){
      return true;
    }
    return false;
  }
}