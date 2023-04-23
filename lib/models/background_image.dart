class BackgroundImage {
  final String backgroundImageUrl;

  BackgroundImage({required this.backgroundImageUrl});

  factory BackgroundImage.fromJson(Map<String, dynamic> json) {
    return BackgroundImage(
      backgroundImageUrl: json['val']['urls']['regular']
    );
  }
}
