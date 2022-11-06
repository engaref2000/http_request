class ImageModel {
  final int id;
  final String url;
  final int albumId;
  final String thumbnailUrl;
  final String title;

  ImageModel(
      {required this.id,
      required this.url,
      required this.title,
      required this.albumId,
      required this.thumbnailUrl});

  ImageModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        url = json['url'] as String,
        albumId = json['albumId'] as int,
        title = json['title'] as String,
        thumbnailUrl = json['thumbnailUrl'] as String;
}
