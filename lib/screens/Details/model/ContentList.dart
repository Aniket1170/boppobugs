class ContentList {
  late int contentTypeId;
  late int contentId;
  late int? seasonId;

  ContentList({
    required this.contentTypeId,
    required this.contentId,
    required this.seasonId,
  });

  ContentList.fromJson(Map<String, dynamic> json) {
    contentTypeId = json['content_type_id'];
    contentId = json['content_id'];
    seasonId = json['season_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content_type_id'] = this.contentTypeId;
    data['content_id'] = this.contentId;
    data['season_id'] = this.seasonId;
    return data;
  }
}
