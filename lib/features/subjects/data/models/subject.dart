class TeacherSubject {
  int id;
  int subjectId;
  int userId;
  int hourlyRate;
  int hourlyRateMultiple;
  int certificationHour;
  List<String> youtubeUrl;
  List<String>? videos;
  List<String>? teacherSubjectImage;
  List<String>? imageList;
  int rating;
  int totalReviews;
  DateTime? deletedAt;
  String? imageUrl;
  List<String>? listImageUrl;
  List<String>? gallery;
  List<String>? videosUrl;
  List<String>? youtubeVideos;
  Subject? subject;

  TeacherSubject({
    required this.id,
    required this.subjectId,
    required this.userId,
    required this.hourlyRate,
    required this.hourlyRateMultiple,
    required this.certificationHour,
    required this.youtubeUrl,
    this.videos,
    this.teacherSubjectImage,
    this.imageList,
    required this.rating,
    required this.totalReviews,
    this.deletedAt,
    this.imageUrl,
    this.listImageUrl,
    this.gallery,
    this.videosUrl,
    this.youtubeVideos,
    this.subject,
  });

  factory TeacherSubject.fromJson(Map<String, dynamic> json) {
    return TeacherSubject(
      id: json['id'],
      subjectId: json['subject_id'],
      userId: json['user_id'],
      hourlyRate: json['hourlyRate'],
      hourlyRateMultiple: json['hourly_rate_multiple'],
      certificationHour: json['certification_hour'],
      youtubeUrl: List<String>.from(json['youtubeUrl']),
      videos: json['videos'] != null ? List<String>.from(json['videos']) : null,
      teacherSubjectImage: json['teacherSubjectImage'] != null
          ? List<String>.from(json['teacherSubjectImage'])
          : null,
      imageList: json['imageList'] != null
          ? List<String>.from(json['imageList'])
          : null,
      rating: json['rating'],
      totalReviews: json['total_reviews'],
      deletedAt: json['deleted_at'] != null
          ? DateTime.parse(json['deleted_at'])
          : null,
      imageUrl: json['image_url'],
      listImageUrl: List<String>.from(json['list_image_url'].cast<String>()),
      gallery: List<String>.from(json['gallery'].cast<String>()),
      videosUrl: List<String>.from(json['videos_url'].cast<String>()),
      youtubeVideos: List<String>.from(json['youtube_videos'].cast<String>()),
      subject: Subject.fromJson(json['subject']),
    );
  }
}

class Subject {
  int id;
  Map<String, String> name;
  String subjectsImage;
  String slug;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;
  String imageUrl;
  int visibleCategoryCount;
  String langName;

  Subject({
    required this.id,
    required this.name,
    required this.subjectsImage,
    required this.slug,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.imageUrl,
    required this.visibleCategoryCount,
    required this.langName,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['id'],
      name: Map<String, String>.from(json['name']),
      subjectsImage: json['subjects_image'],
      slug: json['slug'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'] != null
          ? DateTime.parse(json['deleted_at'])
          : null,
      imageUrl: json['image_url'],
      visibleCategoryCount: json['visible_category_count'],
      langName: json['lang_name'],
    );
  }
}
