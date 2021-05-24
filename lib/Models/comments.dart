class Comment {
  final String comment;
  final Map<String, dynamic> user;

  Comment(this.comment, this.user);

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(json['comment'], json['user']);
  }

  Map<String, dynamic> toMap() {
    return {
      'comment': comment,
      'user': user,
    };
  }
}
