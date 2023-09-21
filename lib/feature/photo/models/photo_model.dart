class PhotoModel {
  final String title;
  final String description;
  final String fileUrl;
  final String creatorUid;
  final String creator;

  final int likes;
  final int comments;
  final int createdAt;

  PhotoModel({
    required this.title,
    required this.description,
    required this.fileUrl,
    required this.creatorUid,
    required this.likes,
    required this.comments,
    required this.createdAt,
    required this.creator,
  });

  PhotoModel.fromJson({
    required Map<String, dynamic> json,
    required String videoId,
  })  : title = json["title"],
        description = json["description"],
        fileUrl = json["fileUrl"],
        creatorUid = json["creatorUid"],
        likes = json["likes"],
        comments = json["comments"],
        createdAt = json["createdAt"],
        creator = json["creator"];

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "fileUrl": fileUrl,
      "creatorUid": creatorUid,
      "likes": likes,
      "comments": comments,
      "createdAt": createdAt,
      "creator": creator,
    };
  }
}
