class EpisodeModel{
  String title;
  String image;
  String url;
  final Duration duration;
  EpisodeModel({
    required this.title,
    required this.image,
    required this.url,
    required this.duration,

});

  String get formattedDuration {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '$minutes دقيقة و $seconds ثانية';
  }
}