import 'dart:convert';
import "package:http/http.dart" as http;
import 'dart:developer';
class PostService{

  final http.Client _client;
  PostService({http.Client? client}):_client=client??http.Client();
  static const _baseUrl='https://jsonplaceholder.typicode.com';
  Future<List<Map<String,dynamic>>>fetchPosts() async{
    final uri=Uri.parse('$_baseUrl/posts');
    final res=await _client.get(uri);
    log("1 $res");
    if(res.statusCode!=200){
      throw Exception('Http ${res.statusCode}');
    }
    final decoded=jsonDecode(res.body) as List;
    log("2 decoded $decoded");
    final casted=decoded.cast<Map<String,dynamic>>();
    log("3 casted $casted");
    return casted;
  }
  void dispose(){
    _client.close();
  }
}