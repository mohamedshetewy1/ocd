class VideoModel {
  int? id;
  int? userId;
  int? controlVideoId;
  String? oovideoTime;
  String? vvvideoCompleted;

  VideoModel(
      {this.id,
      this.userId,
      this.controlVideoId,
      this.oovideoTime,
      this.vvvideoCompleted});

  VideoModel.fromJson(Map<String, dynamic> json, {required videos}) {
    id = json['id'];
    userId = json['user_id'];
    controlVideoId = json['control_video_id'];
    oovideoTime = json['oovideo_time'];
    vvvideoCompleted = json['vvvideo_completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['control_video_id'] = controlVideoId;
    data['oovideo_time'] = oovideoTime;
    data['vvvideo_completed'] = vvvideoCompleted;
    return data;
  }
}
