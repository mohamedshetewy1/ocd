class TasksModel {
  int? userId;
  String? tInsertText;
  String? updatedAt;
  String? createdAt;
  int? id;
  bool isDone = false;

  TasksModel(
      {this.isDone = false,
      this.userId,
      this.tInsertText,
      this.updatedAt,
      this.createdAt,
      this.id});

  TasksModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    tInsertText = json['t_insert_text'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['t_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['t_insert_text'] = tInsertText;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
