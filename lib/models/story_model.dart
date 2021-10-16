import 'package:meta/meta.dart';
import 'package:facebookclone/models/models.dart';

class Story {
  final User user;
  final String imageUrl;
  final String videoUrl;
  final bool isViewed;
  final MediaType mediaType;
  final Duration duration;

  const Story(
      {@required this.user,
      @required this.imageUrl,
      this.isViewed = false,
      this.videoUrl =
          "https://static.videezy.com/system/resources/previews/000/007/536/original/rockybeach.mp4",
      this.mediaType,
      this.duration});
}

enum MediaType { image, video }
