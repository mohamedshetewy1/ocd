class TasksModel {
  int? tId;
  String? tInsertText;
  int? userId;
  String? createdAt;
  String? updatedAt;

  TasksModel(
      {this.tId,
      this.tInsertText,
      this.userId,
      this.createdAt,
      this.updatedAt});

  TasksModel.fromJson(Map<String, dynamic> json) {
    tId = json['t_id'];
    tInsertText = json['t_insert_text'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['t_id'] = tId;
    data['t_insert_text'] = tInsertText;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
