class ToDoItemResponse {
  ToDoItemResponse({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });
  late final int? userId;
  late final int? id;
  late final String? title;
  late final bool? completed;

  ToDoItemResponse.fromJson(Map<String, dynamic> json){
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userId'] = userId;
    _data['id'] = id;
    _data['title'] = title;
    _data['completed'] = completed;
    return _data;
  }
}