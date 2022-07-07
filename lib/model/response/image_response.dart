class ImageResponse {
  int? _total;
  int? _totalImages;
  List<AppImage>? _images;

  ImageResponse({
    int? total,
    int? totalImages,
    List<AppImage>? images,
  }) {
    _total = total;
    _totalImages = totalImages;
    _images = images;
  }

  int? get total => _total;

  int? get totalImages => _totalImages;

  List<AppImage>? get images => _images;

  ImageResponse.fromJson(Map<String, dynamic> json) {
    _total = json['total'];
    _totalImages = json['totalHits'];

    if (json['hits'] != null) {
      _images = [];
      json['hits'].forEach((v) {
        _images!.add(AppImage.fromMap(v));
      });
    }
  }
}

class AppImage {
  int? _id;
  String? _pageURL;
  String? _type;
  String? _tags;
  String? _previewURL;
  int? _previewWidth;
  int? _previewHeight;
  String? _webFormatURL;
  int? _webFormatWidth;
  int? _webFormatHeight;
  String? _largeImageURL;
  int? _imageWidth;
  int? _imageHeight;
  int? _imageSize;
  int? _views;
  int? _downloads;
  int? _collections;
  int? _likes;
  int? _comments;
  int? _userId;
  String? _user;
  String? _userImageURL;

  AppImage({
    int? id,
    String? pageURL,
    String? type,
    String? tags,
    String? previewURL,
    int? previewWidth,
    int? previewHeight,
    String? webFormatURL,
    int? webFormatWidth,
    int? webFormatHeight,
    String? largeImageURL,
    int? imageWidth,
    int? imageHeight,
    int? imageSize,
    int? views,
    int? downloads,
    int? collections,
    int? likes,
    int? comments,
    int? userId,
    String? user,
    String? userImageURL,
  }) {
    _id = id;
    _pageURL = pageURL;
    _type = type;
    _tags = tags;
    _previewURL = previewURL;
    _previewWidth = previewWidth;
    _previewHeight = previewHeight;
    _webFormatURL = webFormatURL;
    _webFormatWidth = webFormatWidth;
    _webFormatHeight = webFormatHeight;
    _largeImageURL = largeImageURL;
    _imageWidth = imageWidth;
    _imageHeight = imageHeight;
    _imageSize = imageSize;
    _views = views;
    _downloads = downloads;
    _collections = collections;
    _likes = likes;
    _comments = comments;
    _userId = userId;
    _user = user;
    _userImageURL = userImageURL;
  }

  int? get id => _id;

  String? get pageURL => _pageURL;

  String? get type => _type;

  String? get tags => _tags;

  String? get previewURL => _previewURL;

  int? get previewWidth => _previewWidth;

  int? get previewHeight => _previewHeight;

  String? get webFormatURL => _webFormatURL;

  int? get webFormatWidth => _webFormatWidth;

  int? get webFormatHeight => _webFormatHeight;

  String? get largeImageURL => _largeImageURL;
  int? get imageWidth => _imageWidth;
  int? get imageHeight => _imageHeight;
  int? get imageSize => _imageSize;
  int? get views => _views;
  int? get downloads => _downloads;
  int? get collections => _collections;
  int? get likes => _likes;
  int? get comments => _comments;
  int? get userId => _userId;
  String? get user => _user;
  String? get userImageURL => _userImageURL;

  AppImage.fromMap(Map<String, dynamic> json) {
    _id = json['id'];
    _pageURL = json['pageURL'];
    _type = json['type'];
    _tags = json['tags'];
    _previewURL = json['previewURL'];
    _previewWidth = json['previewWidth'];
    _previewHeight = json['previewHeight'];
    _webFormatURL = json['webformatURL'];
    _webFormatWidth = json['webformatWidth'];
    _webFormatHeight = json['webformatHeight'];
    _largeImageURL = json['largeImageURL'];
    _imageWidth = json['imageWidth'];
    _imageHeight = json['imageHeight'];
    _imageSize = json['imageSize'];
    _views = json['views'];
    _downloads = json['downloads'];
    _collections = json['collections'];
    _likes = json['likes'];
    _comments = json['comments'];
    _userId = json['user_id'];
    _user = json['user'];
    _userImageURL = json['userImageURL'];
  }
}
