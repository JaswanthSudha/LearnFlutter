class Post {
  final int id;
  final int userId;
  final String title;
  final String body;
  const Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });
  //convert to json data into post object
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      userId: json['userId'] as int,
      title: json['title'] as String,
      body: json['title'] as String,
    );
  }
  //convert post object to json
  Map<String, dynamic> toPost() {
    return {"id": id, "userId": userId, "title": title, 'body': body};
  }

  Post copyWith({int? id, int? userId, String? title, String? body}) => Post(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    title: title ?? this.title,
    body: body ?? this.body,
  );
}
